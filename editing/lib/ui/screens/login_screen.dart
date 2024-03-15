import 'package:editing/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kdbx/kdbx.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../service/app_service.dart';
import '../../store/app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    AppStore _appStore = Provider.of<AppStore>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _profileImage(),
              Observer(
                builder: (_) {
                  return _appStore.isLogging ? _progressBar() : _input(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 50.0),
      child: SvgPicture.asset(
        "assets/images/super-man-flatline.svg",
        height: 100,
      ),
    );
  }

  Widget _input(BuildContext context) {
    AppStore appStore = Provider.of<AppStore>(context);
    AppService appService = Provider.of<AppService>(context);
    final logger = Logger();

    onLogin(ProtectedValue p) async {
      appStore.setLogging(true);
      try {
        final meta = await appService.login(p);
        AppDb db = AppDb.open("${meta.dbInstance}.enc", meta.dbEncryptionKey);
        appStore.authenticate(meta, db);
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, "/home");
        }
      } catch (e) {
        logger.e(e);
        await Future.delayed(const Duration(seconds: 1));
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            showCloseIcon: true,
            backgroundColor: Colors.redAccent,
            content: Text("Login failed!"),
          ));
        }
      } finally {
        appStore.setLogging(false);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            obscureText: true,
            autofocus: false,
            decoration: const InputDecoration(
              hintText: "Please input master password",
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.red,
                size: 22.0,
              ),
            ),
            onSubmitted: (value) => onLogin(ProtectedValue.fromString(value)),
          ),
        ],
      ),
    );
  }

  Widget _progressBar() {
    return const Column(
      children: <Widget>[
        CircularProgressIndicator(),
        Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Loading..."),
          ),
        ),
      ],
    );
  }

  Future<void> onLogin(ProtectedValue password) async {}
}
