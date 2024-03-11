import 'dart:math';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:editing/common/argon2_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kdbx/kdbx.dart';

void main() {
  test('should return argon2 derived key', () async {
    final salt = hex.decode(
            "3f09ea13ceffb8e867a4af3ab17854f9f5f152591653c737a8962b94356e2c0f")
        as Uint8List;
    final password = hex.decode(
            "bfa11b4e4376cf1b17088a3de375f1df6a9c4cb3eb36f3ce2416b10481eb619f")
        as Uint8List;
    //  argon2: seed=kef.seed, version=19, rounds=2, memory=1024, parallelism=2
    final key = await Argon2Util.deriveKey(
      Argon2Arguments(password, salt, 1024, 2, 32, 2, ARGON2_d, 19),
    );
    expect(
        key,
        equals(hex.decode(
            "104e9ba7b6b4479eec1a8fe3f9ca285fd10e0f33435fcabd8edf3e16380a98c7")));
  });

  test('should return argon2key with parameters', () async {
    final salt = hex.decode(
            "3f09ea13ceffb8e867a4af3ab17854f9f5f152591653c737a8962b94356e2c0f")
        as Uint8List;
    final password = hex.decode(
            "bfa11b4e4376cf1b17088a3de375f1df6a9c4cb3eb36f3ce2416b10481eb619f")
        as Uint8List;
    final args = Argon2Arguments(password, salt, 1024, 2, 32, 2, ARGON2_d, 19);
    final key = await Argon2Util.deriveKey(args);
    final hash = Argon2Util.formatArgon2Hash(args, key);
    expect(
        hash,
        equals(
            '\$argon2d\$v=19\$m=1024,t=2,p=2\$PwnqE87/uOhnpK86sXhU+fXxUlkWU8c3qJYrlDVuLA8=\$EE6bp7a0R57sGo/j+cooX9EODzNDX8q9jt8+FjgKmMc='));
  });
}
