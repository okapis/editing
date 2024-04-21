import 'package:editing/service/password_service.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:kdbx/kdbx.dart';
import 'package:mobx/mobx.dart';

import '../database/database.dart';
import '../domain/password.dart';
import 'app.dart';
import 'password_list.dart';

part 'password_edit.g.dart';

class PasswordEditStore = PasswordEditBase with _$PasswordEditStore;

abstract class PasswordEditBase with Store {
  PasswordEditBase(this._appStore, this._passwordListStore,
      this._passwordService, this.id, this.isEditing);

  final AppStore _appStore;
  final PasswordListStore _passwordListStore;
  final PasswordService _passwordService;

  @observable
  bool isEditing;

  @observable
  int? id;

  @observable
  Password? item;

  AppDb getDb() {
    assert(_appStore.openedDb != null);
    return _appStore.openedDb!;
  }

  @action
  Future<Password?> fetch() async {
    if (id == null) return null;
    final db = getDb();
    final detail = await _passwordService.fetchById(db, id!);
    item = detail;
    return detail;
  }

  @action
  Future<void> create(String title, ProtectedValue password, String url,
      String user, String remark) async {
    final db = getDb();
    item = await _passwordService.createPassword(db, title, password,
        url: url, username: user, remark: remark);
    await _passwordListStore.fetchAll();
  }

  @action
  Future<void> update(String title, ProtectedValue password, String url,
      String user, String remark) async {
    assert(id != null);
    assert(item != null);

    final db = getDb();
    item = await _passwordService.updatePassword(db, id!, title, password,
        url: url, username: user, remark: remark);
    await _passwordListStore.fetchAll();
  }

  @action
  Future<void> delete() async {
    assert(id != null);
    await _passwordListStore.delete(id!);
  }
}
