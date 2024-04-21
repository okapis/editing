import 'dart:convert';

import 'package:editing/domain/note.dart';
import 'package:editing/service/note_service.dart';
import 'package:editing/service/password_service.dart';
import 'package:editing/store/note_edit.dart';
import 'package:editing/store/note_list.dart';
import 'package:editing/store/password_edit.dart';
import 'package:editing/store/password_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:kdbx/kdbx.dart';
import 'package:provider/provider.dart';

import '../store/app.dart';

class PasswordEditScreen extends StatefulWidget {
  final int? id;
  final bool readonly;
  const PasswordEditScreen({super.key, this.id, required this.readonly});

  @override
  State<PasswordEditScreen> createState() => _PasswordEditScreenState();
}

class _PasswordEditScreenState extends State<PasswordEditScreen> {
  final _titleController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _userController = TextEditingController();
  final _urlController = TextEditingController();
  final _remarkController = TextEditingController();

  late PasswordEditStore _store;

  @override
  void dispose() {
    _titleController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _userController.dispose();
    _urlController.dispose();
    _remarkController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    AppStore appStore = Provider.of<AppStore>(context);
    PasswordListStore listStore = Provider.of<PasswordListStore>(context);
    PasswordService service = Provider.of<PasswordService>(context);
    _store = PasswordEditStore(
        appStore, listStore, service, widget.id, !widget.readonly);
    _store.fetch().then((value) {
      _titleController.text = value?.title ?? "";
      _urlController.text = value?.url ?? "";
      _userController.text = value?.username ?? "";
      _passwordController.text = value?.value.getText() ?? "";
      _remarkController.text = value?.remark ?? "";
    });
  }

  Widget _reanderEditor() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextField(
            autofocus: true,
            readOnly: !_store.isEditing,
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: 'Password title',
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        TextField(
          autofocus: true,
          readOnly: !_store.isEditing,
          controller: _urlController,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.link_outlined),
            hintText: 'URL',
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        TextField(
          autofocus: true,
          readOnly: !_store.isEditing,
          controller: _userController,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.account_circle_outlined),
            hintText: 'User name',
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        TextField(
          autofocus: true,
          obscureText: true,
          readOnly: !_store.isEditing,
          controller: _passwordController,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.lock_outline),
            hintText: 'Password',
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        TextField(
          autofocus: true,
          obscureText: true,
          readOnly: !_store.isEditing,
          controller: _passwordConfirmController,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.lock_outline),
            hintText: 'Confirm password',
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        Expanded(
          child: TextField(
            autofocus: true,
            maxLines: 3,
            readOnly: !_store.isEditing,
            controller: _remarkController,
            decoration: const InputDecoration(
              hintText: 'Remark',
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          actions: [
            if (!_store.isEditing)
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                tooltip: 'Edit',
                onPressed: () {
                  _store.isEditing = true;
                },
              ),
            if (!_store.isEditing)
              IconButton(
                icon: const Icon(Icons.delete_outline),
                tooltip: 'Delete',
                onPressed: () async {
                  await _store.delete();
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            if (_store.isEditing)
              IconButton(
                icon: const Icon(Icons.cancel_outlined),
                tooltip: 'Cancel',
                onPressed: () async {
                  _store.isEditing = false;
                  if (widget.id != null) {
                    await _store.fetch();
                  } else {
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                },
              ),
            if (_store.isEditing)
              IconButton(
                icon: const Icon(Icons.check_outlined),
                tooltip: 'Save',
                onPressed: () async {
                  if (widget.id != null) {
                    await _store.update(
                        _titleController.text,
                        ProtectedValue.fromString(_passwordController.text),
                        _urlController.text,
                        _userController.text,
                        _remarkController.text);
                  } else {
                    await _store.create(
                        _titleController.text,
                        ProtectedValue.fromString(_passwordController.text),
                        _urlController.text,
                        _userController.text,
                        _remarkController.text);
                  }

                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: _reanderEditor(),
        ),
      ),
    );
  }
}
