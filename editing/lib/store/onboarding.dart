import 'package:kdbx/kdbx.dart';
import 'package:mobx/mobx.dart';

part 'onboarding.g.dart';

class OnboardingStore = OnboardingBase with _$OnboardingStore;

abstract class OnboardingBase with Store {
  ProtectedValue? _password1;
  ProtectedValue? _password2;

  @action
  void setPassword1(ProtectedValue password) {
    _password1 = password;
  }

  @action
  void setPassword2(ProtectedValue password) {
    _password2 = password;
  }

  @computed
  ProtectedValue get password => _password1!;

  @computed
  bool get isPasswordValid =>
      _password1 != null && _password2 != null && _password1 == _password2;
}
