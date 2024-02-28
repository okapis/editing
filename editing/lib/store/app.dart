import 'package:mobx/mobx.dart';

part 'app.g.dart';

class App = _App with _$App;

abstract class _App with Store {
  _App(
    this.isAuthenticated,
  );

  @observable
  bool isAuthenticated = false;
}
