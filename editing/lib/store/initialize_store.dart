import 'package:mobx/mobx.dart';

import '../common/protected_value.dart';
import '../service/init_service.dart';

part 'initialize_store.g.dart';

class InitializeStore = _InitializeStore with _$InitializeStore;

abstract class _InitializeStore with Store {
  final InitializeService _initializeService;

  ProtectedValue? _masterPassword;

  ProtectedValue? _secondaryPassword;

  @observable
  bool enableFingerPrint;

  @observable
  bool agreeUserAgreement;

  @observable
  String? errorMessage;

  @observable
  bool isSettingsCompleted;

  _InitializeStore(this._initializeService)
      : _masterPassword = null,
        _secondaryPassword = null,
        errorMessage = null,
        enableFingerPrint = false,
        agreeUserAgreement = false,
        isSettingsCompleted = false;

  @action
  void setMasterPassword(ProtectedValue password) {
    _masterPassword = password;
  }

  void setPasswords(ProtectedValue password, ProtectedValue secondaryPassword) {
    _masterPassword = password;
    _secondaryPassword = secondaryPassword;
  }

  @action
  void setEnableFingerPrint(bool enabled) {
    enableFingerPrint = enabled;
  }

  @action
  void setAgreeUserAgreement(bool agree) {
    agreeUserAgreement = agree;
  }

  @action
  Future<void> initialize() async {
    assert(_masterPassword != null);
    assert(_secondaryPassword != null);
    assert(agreeUserAgreement);

    await _initializeService.initialize(
        _masterPassword!, _secondaryPassword!, enableFingerPrint);
  }
}
