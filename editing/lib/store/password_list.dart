import 'package:editing/database/database.dart';
import 'package:editing/service/note_service.dart';
import 'package:editing/service/password_service.dart';
import 'package:mobx/mobx.dart';
import '../domain/password.dart';
import 'app.dart';

part 'password_list.g.dart';

class PasswordListStore = PasswordListBase with _$PasswordListStore;

abstract class PasswordListBase with Store {
  final AppStore _appStore;
  final PasswordService _passwordService;

  @observable
  ObservableList<Password> passwords = ObservableList();

  @observable
  String? error;

  PasswordListBase(this._appStore, this._passwordService);

  AppDb getDb() {
    assert(_appStore.openedDb != null);
    return _appStore.openedDb!;
  }

  @action
  Future<void> fetchAll() async {
    final db = getDb();
    final result = await _passwordService.fetchAll(db);
    passwords.clear();
    passwords.addAll(result);
  }

  @action
  Future<void> delete(int id) async {
    final db = getDb();
    await _passwordService.deletePassword(db, id);
    passwords.removeWhere((element) => element.id == id);
  }
}
