import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:editing/common/uuid_util.dart';
import 'package:kdbx/kdbx.dart';
import 'package:pointycastle/key_derivators/argon2_native_int_impl.dart';
import 'package:pointycastle/pointycastle.dart';

import '../config/version.dart';

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

  Uint8List _generateKey(Uint8List salt, ProtectedValue password) {
    final kdf = Argon2BytesGenerator();
    kdf.init(Argon2Parameters(
      Argon2Parameters.ARGON2_d,
      salt,
      desiredKeyLength: 32,
      iterations: 32,
      memory: 1024 * 1024,
      lanes: 2,
      version: Argon2Parameters.ARGON2_VERSION_13,
    ));
    return kdf.process(password.binaryValue);
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
