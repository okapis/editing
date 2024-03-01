import 'package:mobx/mobx.dart';

part 'onboarding.g.dart';

class OnboardingStore = OnboardingBase with _$OnboardingStore;

abstract class OnboardingBase with Store {
  final totalSteps = 3;

  @observable
  int currentStep = 0;

  @action
  void continueStep() {
    if (currentStep < totalSteps - 1) currentStep++;
  }

  @action
  void cancelStep() {
    if (currentStep > 0) currentStep--;
  }

  @computed
  bool get isLastStep => currentStep == totalSteps - 1;

  @computed
  bool get isFirstStep => currentStep == 0;
}
