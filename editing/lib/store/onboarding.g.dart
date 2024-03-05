// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingStore on OnboardingBase, Store {
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: 'OnboardingBase.isPasswordValid'))
          .value;

  late final _$OnboardingBaseActionController =
      ActionController(name: 'OnboardingBase', context: context);

  @override
  void setPassword1(ProtectedValue password) {
    final _$actionInfo = _$OnboardingBaseActionController.startAction(
        name: 'OnboardingBase.setPassword1');
    try {
      return super.setPassword1(password);
    } finally {
      _$OnboardingBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword2(ProtectedValue password) {
    final _$actionInfo = _$OnboardingBaseActionController.startAction(
        name: 'OnboardingBase.setPassword2');
    try {
      return super.setPassword2(password);
    } finally {
      _$OnboardingBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordValid: ${isPasswordValid}
    ''';
  }
}
