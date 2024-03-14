import 'package:editing/config/meta.dart';
import 'package:editing/database/database.dart';
import 'package:kdbx/kdbx.dart';
import 'package:mobx/mobx.dart';

part 'app.g.dart';

class AppStore = AppBase with _$AppStore;

abstract class AppBase with Store {
  @observable
  bool isLogging = false;

  @observable
  Meta? meta;

  @observable
  AppDb? openedDb;

  @computed
  bool get isAuthenticated => meta != null;

  @action
  void setLogging(bool isLogging) {
    this.isLogging = isLogging;
  }

  @action
  void authenticate(Meta meta, AppDb db) {
    this.meta = meta;
    openedDb = db;
  }

  @action
  Future<void> logout() async {
    await openedDb?.close();
    meta = null;
    openedDb = null;
  }
}
