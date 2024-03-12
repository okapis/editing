import 'package:editing/config/meta.dart';
import 'package:editing/database/database.dart';
import 'package:kdbx/kdbx.dart';
import 'package:mobx/mobx.dart';

part 'app.g.dart';

class AppStore = AppBase with _$AppStore;

abstract class AppBase with Store {
  @observable
  bool isAuthenticated = false;

  @observable
  bool isLogging = false;

  @observable
  Meta? meta;

  @observable
  AppDb? openedDb;

  @action
  void setLogging(bool isLogging) {
    this.isLogging = isLogging;
  }

  @action
  void authenticate(Meta meta, AppDb db) {
    this.meta = meta;
    isAuthenticated = true;
    openedDb = db;
  }

  @action
  Future<void> logout() async {
    await openedDb?.close();
    meta = null;
    isAuthenticated = false;
    openedDb = null;
  }
}
