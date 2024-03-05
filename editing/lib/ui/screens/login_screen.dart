import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    AppStore _appStore = Provider.of<AppStore>(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 10.0, 50, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            obscureText: true,
            autofocus: false,
            decoration: InputDecoration(
              hintText: "Please input master password",
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.red,
                size: 22.0,
              ),
            ),
            onSubmitted: (value) => _appStore.setLogging(true),
          ),
        ],
      ),
    );
  }

  Widget _progressBar() {
    return Column(
      children: <Widget>[
        const CircularProgressIndicator(),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Loading..."),
          ),
        ),
      ],
    );
  }
}
