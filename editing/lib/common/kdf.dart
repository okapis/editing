import 'dart:typed_data';

import 'package:dargon2_flutter/dargon2_flutter.dart';
import 'package:editing/common/protected_value.dart';

abstract class Kdf {
  Future<Uint8List> derive(ProtectedValue password, Uint8List salt);
}

class Argon2Kdf implements Kdf {
  @override
  Future<Uint8List> derive(ProtectedValue password, Uint8List salt) async {
    //Hash with pre-set params (iterations: 32, memory: 256, parallelism: 2,
    //length: 32, type: Argon2Type.i, version: Argon2Version.V13)
    final result =
        await argon2.hashPasswordBytes(password.binaryValue, salt: Salt(salt));
    return Uint8List.fromList(result.rawBytes);
  }
}
