// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PasswordListStore on PasswordListBase, Store {
  late final _$passwordsAtom =
      Atom(name: 'PasswordListBase.passwords', context: context);

  @override
  ObservableList<Password> get passwords {
    _$passwordsAtom.reportRead();
    return super.passwords;
  }

  @override
  set passwords(ObservableList<Password> value) {
    _$passwordsAtom.reportWrite(value, super.passwords, () {
      super.passwords = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'PasswordListBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$fetchAllAsyncAction =
      AsyncAction('PasswordListBase.fetchAll', context: context);

  @override
  Future<void> fetchAll() {
    return _$fetchAllAsyncAction.run(() => super.fetchAll());
  }

  late final _$deleteAsyncAction =
      AsyncAction('PasswordListBase.delete', context: context);

  @override
  Future<void> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
passwords: ${passwords},
error: ${error}
    ''';
  }
}
