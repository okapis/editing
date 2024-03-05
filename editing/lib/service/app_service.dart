import 'dart:io';

import 'package:kdbx/kdbx.dart';
import 'package:logger/logger.dart';

import '../common/path_util.dart';

class AppService {
  final logger = Logger();

  static const String configFileName = "app.kdbx";
  static KdbxFormat kdbxFormat = KdbxFormat();

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
      await kdbxFormat.read(data, Credentials(password));
      return true;
    } on KdbxInvalidKeyException catch (e) {
      return false;
    }
  }

  Future<KdbxFile> initialize(ProtectedValue masterPassword) async {
    final credentials = Credentials(masterPassword);
    final kdbx = kdbxFormat.create(
      credentials,
      'master.kdbx',
    );
    final rootGroup = kdbx.body.rootGroup;
    final entry = KdbxEntry.create(kdbx, rootGroup);
    entry.setString(KdbxKey("KEY"), ProtectedValue.fromString("123456789"));
    final saved = await kdbx.save();
    final configFile = await getAppConfigFile();

    logger.i("Initializing config:$configFile");

    assert(!configFile.existsSync());
    configFile.writeAsBytesSync(saved);

    return kdbx;
  }
}
