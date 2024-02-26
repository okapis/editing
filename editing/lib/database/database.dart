import 'dart:io';
import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:editing/common/uuid_util.dart';
import 'package:editing/config/version.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/open.dart';
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';

// run `dart run build_runner build` to generate
part 'database.g.dart';

const _encryptionPassword = 'somepassword';

@DriftDatabase(include: {'tables.drift'})
class AppDb extends _$AppDb {
  AppDb() : super(_openDatabase());
  AppDb.from(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<void> _insertConfiguration(
      String key, String value, String createTime) async {
    await into(configuration).insert(ConfigurationData(
      name: key,
      value: value,
      createTime: createTime,
      lastUpdateTime: createTime,
    ));
  }

  Future<void> _inintConfiguration() async {
    final now = DateTime.now().toUtc().toIso8601String();
    await _insertConfiguration('APP_VERSION', APP_VERSION, now);
    await _insertConfiguration('SQLCIPHER_VERSION', SQLCIPHER_VERSION, now);
    await _insertConfiguration('SEED', UuidUtil.generateUUID(), now);
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {},
      onCreate: (Migrator m) async {
        await m.createAll();
        await transaction(() async {
          await _inintConfiguration();
        });
      },
    );
  }
}

void setupSqlCipher() {
  open
    ..overrideFor(OperatingSystem.android, openCipherOnAndroid)
    ..overrideFor(
        OperatingSystem.linux, () => DynamicLibrary.open('libsqlcipher.so'))
    ..overrideFor(
        OperatingSystem.windows, () => DynamicLibrary.open('sqlcipher.dll'));
}

QueryExecutor _openDatabase() {
  return LazyDatabase(() async {
    final path = await getApplicationDocumentsDirectory();
    return NativeDatabase.createInBackground(
      File(p.join(path.path, 'app.db.enc')),
      isolateSetup: setupSqlCipher,
      setup: (rawDb) {
        final result = rawDb.select('pragma cipher_version');
        if (result.isEmpty) {
          throw UnsupportedError(
            'This database needs to run with SQLCipher, but that library is '
            'not available!',
          );
        } else {
          final cipherVersion = result.single['cipher_version'];
          if (cipherVersion != '4.5.6 community') {
            throw UnsupportedError(
              'This application only supports SQLCipher with version=4.5.6 community, '
              'however database with version=$cipherVersion detected',
            );
          }
        }
        final escapedKey = _encryptionPassword.replaceAll("'", "''");
        rawDb.execute("pragma key = '$escapedKey';");
        rawDb.execute('select count(*) from sqlite_master');
      },
    );
  });
}
