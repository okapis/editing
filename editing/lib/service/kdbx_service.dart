import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:editing/common/uuid_util.dart';
import 'package:kdbx/kdbx.dart';
import 'package:pointycastle/key_derivators/argon2_native_int_impl.dart';
import 'package:pointycastle/pointycastle.dart';

import '../config/version.dart';

/// Argon2 parameters recommendation by OWASP:
/// see: https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html#:~:text=To%20sum%20up%20our%20recommendations,a%20parallelization%20parameter%20of%201.
///

class KdbxService {
  static KdbxFormat kdbxFormat = KdbxFormat();
  static final valueKey = KdbxKey("value");

  Future<KdbxFile> create(ProtectedValue masterPassword) async {
    final credentials = Credentials(masterPassword);
    final kdbx = kdbxFormat.create(
      credentials,
      'eDiting KeyStore',
    );
    final rootGroup = kdbx.body.rootGroup;
    _createEntry(kdbx, rootGroup, "APP_VERSION", APP_VERSION);
    _createEntry(kdbx, rootGroup, "SQLCIPHER_VERSION", SQLCIPHER_VERSION);
    _createEntry(kdbx, rootGroup, "SEED", UuidUtil.generateUUID());

    final dbEncryptKey = sha256
        .convert(sha256.convert(utf8.encode(UuidUtil.generateUUID())).bytes)
        .bytes as Uint8List;
    final dbSalt = sha256
        .convert(sha256.convert(utf8.encode(UuidUtil.generateUUID())).bytes)
        .bytes as Uint8List;
    final dbEncryptKeyEntry = _createEntryRaw(kdbx, rootGroup,
        "SQLCIPHER_PASSWORD", ProtectedValue.fromRawBinary(dbEncryptKey));
    dbEncryptKeyEntry.setString(
        KdbxKey("salt"), ProtectedValue.fromRawBinary(dbSalt));
    dbEncryptKeyEntry.setString(KdbxKey("type"), PlainValue("argon2d"));
    dbEncryptKeyEntry.setString(KdbxKey("iterations"), PlainValue("32"));
    dbEncryptKeyEntry.setString(KdbxKey("memory"), PlainValue("1024 * 1024"));
    dbEncryptKeyEntry.setString(KdbxKey("parallelism"), PlainValue("2"));
    return kdbx;
  }

  KdbxEntry _createEntry(
      KdbxFile file, KdbxGroup group, String title, String value) {
    return _createEntryRaw(file, group, title, PlainValue(value));
  }

  KdbxEntry _createEntryRaw(
      KdbxFile file, KdbxGroup group, String title, StringValue value) {
    final entry = KdbxEntry.create(file, group);
    group.addEntry(entry);
    entry.setString(KdbxKeyCommon.TITLE, PlainValue(title));
    entry.setString(valueKey, value);
    return entry;
  }
}
