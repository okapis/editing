import 'dart:convert';
import 'dart:typed_data';

import 'package:kdbx/kdbx.dart';

class Argon2Util {
  static const argon2 = PointyCastleArgon2();
  static Future<Uint8List> deriveKey(Argon2Arguments args) async {
    return argon2.argon2Async(args);
  }

  static String formatArgon2Hash(
    Argon2Arguments args,
    Uint8List derivedKey,
  ) {
    String argon2Type = "";
    switch (args.type) {
      case ARGON2_i:
        argon2Type = "argon2i";
      case ARGON2_d:
        argon2Type = "argon2d";
      case ARGON2_id:
        argon2Type = "argon2id";
    }
    String version = "v=${args.version}";
    String memory = "m=${args.memory}";
    String iterations = "t=${args.iterations}";
    String parallelism = "p=${args.parallelism}";
    String saltString = base64.encode(args.salt);
    String hashString = base64.encode(derivedKey);

    return "\$$argon2Type\$$version\$$memory,$iterations,$parallelism\$$saltString\$$hashString";
  }
}
