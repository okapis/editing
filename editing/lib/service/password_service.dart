import 'package:drift/drift.dart';
import 'package:editing/database/database.dart';
import 'package:editing/domain/common.dart';
import 'package:kdbx/kdbx.dart';

import '../domain/password.dart';

class PasswordService {
  Future<List<Password>> fetchAll(AppDb db) async {
    final items = await db.fetchPasswordBasics().get();
    final categories = await db.categories.select().get();
    return items
        .map(
          (item) => Password.fromEntity(
            PasswordEntity(
                id: item.id,
                title: item.title,
                expireTime: item.expireTime,
                value: "",
                remark: item.remark,
                encryptType: item.encryptType,
                createTime: item.createTime,
                lastUpdateTime: item.lastUpdateTime),
            item.categoryId == null
                ? null
                : categories.firstWhere((e) => e.id == item.categoryId),
          ),
        )
        .toList();
  }

  Future<Password> fetchById(AppDb db, int id) async {
    final item = await (db.passwords.select()
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
    CategoryEntity? category;
    if (item.categoryId != null) {
      category = await (db.categories.select()
            ..where((tbl) => tbl.id.equals(item.categoryId!)))
          .getSingle();
    }
    return Password.fromEntity(item, category);
  }

  Future<Password> insertPassword(AppDb db, Password item) async {
    assert(item.id == null);
    final id = await db.into(db.passwords).insert(item.toCompanion());
    item.id = id;
    return item;
  }

  Future<Password> createPassword(
      AppDb db, String title, ProtectedValue value) async {
    final now = DateTime.now();
    final item = Password(
      title: title,
      value: value,
      encryptType: EncryptType.none,
      createTime: now,
      lastUpdateTime: now,
    );
    return insertPassword(db, item);
  }
}
