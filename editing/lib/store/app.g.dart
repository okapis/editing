// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on AppBase, Store {
  Computed<bool>? _$isAuthenticatedComputed;

  @override
  bool get isAuthenticated =>
      (_$isAuthenticatedComputed ??= Computed<bool>(() => super.isAuthenticated,
              name: 'AppBase.isAuthenticated'))
          .value;

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

  late final _$metaAtom = Atom(name: 'AppBase.meta', context: context);

  @override
  Meta? get meta {
    _$metaAtom.reportRead();
    return super.meta;
  }

  @override
  set meta(Meta? value) {
    _$metaAtom.reportWrite(value, super.meta, () {
      super.meta = value;
    });
  }

  late final _$openedDbAtom = Atom(name: 'AppBase.openedDb', context: context);

  @override
  AppDb? get openedDb {
    _$openedDbAtom.reportRead();
    return super.openedDb;
  }

  @override
  set openedDb(AppDb? value) {
    _$openedDbAtom.reportWrite(value, super.openedDb, () {
      super.openedDb = value;
    });
  }

  late final _$logoutAsyncAction =
      AsyncAction('AppBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
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
  void authenticate(Meta meta, AppDb db) {
    final _$actionInfo =
        _$AppBaseActionController.startAction(name: 'AppBase.authenticate');
    try {
      return super.authenticate(meta, db);
    } finally {
      _$AppBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogging: ${isLogging},
meta: ${meta},
openedDb: ${openedDb},
isAuthenticated: ${isAuthenticated}
    ''';
  }
}
