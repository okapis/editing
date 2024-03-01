// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingStore on OnboardingBase, Store {
  Computed<bool>? _$isLastStepComputed;

  @override
  bool get isLastStep =>
      (_$isLastStepComputed ??= Computed<bool>(() => super.isLastStep,
              name: 'OnboardingBase.isLastStep'))
          .value;
  Computed<bool>? _$isFirstStepComputed;

  @override
  bool get isFirstStep =>
      (_$isFirstStepComputed ??= Computed<bool>(() => super.isFirstStep,
              name: 'OnboardingBase.isFirstStep'))
          .value;

  late final _$currentStepAtom =
      Atom(name: 'OnboardingBase.currentStep', context: context);

  @override
  int get currentStep {
    _$currentStepAtom.reportRead();
    return super.currentStep;
  }

  @override
  set currentStep(int value) {
    _$currentStepAtom.reportWrite(value, super.currentStep, () {
      super.currentStep = value;
    });
  }

  late final _$OnboardingBaseActionController =
      ActionController(name: 'OnboardingBase', context: context);

  @override
  void continueStep() {
    final _$actionInfo = _$OnboardingBaseActionController.startAction(
        name: 'OnboardingBase.continueStep');
    try {
      return super.continueStep();
    } finally {
      _$OnboardingBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancelStep() {
    final _$actionInfo = _$OnboardingBaseActionController.startAction(
        name: 'OnboardingBase.cancelStep');
    try {
      return super.cancelStep();
    } finally {
      _$OnboardingBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentStep: ${currentStep},
isLastStep: ${isLastStep},
isFirstStep: ${isFirstStep}
    ''';
  }
}
