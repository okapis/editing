import 'package:mobx/mobx.dart';

part 'app.g.dart';

class AppStore = AppBase with _$AppStore;

abstract class AppBase with Store {
  @observable
  bool isAuthenticated = false;

  @observable
  bool isLogging = false;

  @action
  void setLogging(bool isLogging) {
    this.isLogging = isLogging;
  }
}
