import 'dart:io';

import 'package:editing/database/database.dart';
import 'package:editing/service/kdbx_service.dart';
import 'package:kdbx/kdbx.dart';
import 'package:logger/logger.dart';

import '../common/path_util.dart';

class AppService {
  static const String configFileName = "app.kdbx";
  static KdbxFormat kdbxFormat = KdbxFormat();

  final logger = Logger();
  final KdbxService _kdbxService;

  AppService(this._kdbxService);

  static Future<File> getAppConfigFile() async {
    return File(await PathUtil.getLocalPath(configFileName));
  }

  Future<bool> hasOnboarded() async {
    final File config = await getAppConfigFile();
    return config.existsSync();
  }

  Future<bool> verifyPassword(ProtectedValue password) async {
    final File config = await getAppConfigFile();
    final data = await config.readAsBytes();
    try {
      final file = await kdbxFormat.read(data, Credentials(password));
      return true;
    } on KdbxInvalidKeyException catch (e) {
      return false;
    }
  }

  Future<KdbxFile> initialize(ProtectedValue masterPassword) async {
    final kdbx = await _kdbxService.create(masterPassword);
    final saved = await kdbx.save();
    final configFile = await getAppConfigFile();

    logger.i("Initializing config:$configFile");

    assert(!configFile.existsSync());
    configFile.writeAsBytesSync(saved);

    final meta = await _kdbxService.loadMeta(kdbx);
    final dbFile = "${meta.dbInstance}.enc";
    logger.i("Initializing database:$dbFile");
    final db = AppDb.open(dbFile, meta.dbEncryptionKey);

    // force to trigger database creation
    await db.select(db.journals).get();
    return kdbx;
  }
}
