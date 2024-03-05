// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on AppBase, Store {
  late final _$isAuthenticatedAtom =
      Atom(name: 'AppBase.isAuthenticated', context: context);

  @override
  bool get isAuthenticated {
    _$isAuthenticatedAtom.reportRead();
    return super.isAuthenticated;
  }

  @override
  set isAuthenticated(bool value) {
    _$isAuthenticatedAtom.reportWrite(value, super.isAuthenticated, () {
      super.isAuthenticated = value;
    });
  }

  late final _$isLoggingAtom =
      Atom(name: 'AppBase.isLogging', context: context);

  @override
  bool get isLogging {
    _$isLoggingAtom.reportRead();
    return super.isLogging;
  }

  @override
  set isLogging(bool value) {
    _$isLoggingAtom.reportWrite(value, super.isLogging, () {
      super.isLogging = value;
    });
  }

  late final _$AppBaseActionController =
      ActionController(name: 'AppBase', context: context);

  @override
  void setLogging(bool isLogging) {
    final _$actionInfo =
        _$AppBaseActionController.startAction(name: 'AppBase.setLogging');
    try {
      return super.setLogging(isLogging);
    } finally {
      _$AppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isAuthenticated: ${isAuthenticated},
isLogging: ${isLogging}
    ''';
  }
}
