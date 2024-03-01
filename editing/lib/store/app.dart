import 'package:mobx/mobx.dart';

part 'app.g.dart';

class App = AppBase with _$App;

abstract class AppBase with Store {
  AppBase(
    this.isAuthenticated,
  );

  @observable
  bool isAuthenticated = false;
}
