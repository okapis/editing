import 'package:editing/store/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kdbx/kdbx.dart';
import 'package:provider/provider.dart';

import '../../common/password_validator.dart';
import '../../service/app_service.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

const pageDecoration = PageDecoration(
  imagePadding: EdgeInsets.only(top: 24, bottom: 24),
  bodyAlignment: Alignment.topRight,
  bodyTextStyle: TextStyle(fontSize: 14),
);

final introductionPages = [
  PageViewModel(
    title: "Comprehensive Secret Protection",
    bodyWidget: const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "eDiting goes beyond passwords, providing comprehensive protection for all your sensitive information. Safely store and manage passwords, notes, photos, files, and more within our app's encrypted vault. Advanced algorithms like AES-256 and Argon2 ensure that your secrets remain secure and inaccessible to unauthorized individuals."),
        ],
      ),
    ),
    image: SvgPicture.asset(
      "assets/images/authentication-flatline-48804.svg",
    ),
    decoration: pageDecoration,
  ),
  PageViewModel(
    title: "Strong Encryption with AES-256 and Argon2",
    bodyWidget: const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "Your secrets are encrypted with the highest level of security using AES-256 and Argon2. These industry-standard algorithms make it virtually impossible for anyone to decipher your encrypted data. Rest assured that your secrets are safe from brute-force and dictionary attacks, keeping them confidential and protected."),
        ],
      ),
    ),
    image: SvgPicture.asset(
      "assets/images/super-man-flatline.svg",
    ),
    decoration: pageDecoration,
  ),
  PageViewModel(
    title: "Cross-Platform Support",
    bodyWidget: const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "Access and manage your secrets seamlessly across multiple platforms with eDiting SecureVault. Whether you're using iOS, Android, or desktop, our app synchronizes your encrypted data, ensuring that changes you make on one device are instantly reflected on all others. Enjoy a consistent and user-friendly experience, no matter which platform you're using."),
        ],
      ),
    ),
    image: SvgPicture.asset(
      "assets/images/transferwise-two-color.svg",
    ),
    decoration: pageDecoration,
  ),
];

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    OnboardingStore store = Provider.of<OnboardingStore>(context);
    AppService appService = Provider.of<AppService>(context);

    return Scaffold(
      body: Observer(
        builder: (ctx) => IntroductionScreen(
          pages: [
            ...introductionPages,
            PageViewModel(
              title: "Get Started",
              bodyWidget: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                        "A master password is a crucial security measure that safeguards all your sensitive information. By setting a strong master password, you ensure that your accounts and data are protected from unauthorized access, providing peace of mind and enhancing your online security."),
                    TextFormField(
                      onChanged: (value) =>
                          store.setPassword1(ProtectedValue.fromString(value)),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return validatePassword(value);
                      },
                      decoration: const InputDecoration(
                        labelText: "Master password",
                        hintText: "Please input your password",
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) =>
                          store.setPassword2(ProtectedValue.fromString(value)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please repeat your password';
                        }
                        if (!store.isPasswordValid) {
                          return "Password does not match";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Repeat password",
                        hintText: "Please confirm your password again",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await appService.initialize(store.password);
                            if (context.mounted) {
                              Navigator.pushReplacementNamed(context, "/login");
                            }
                          }
                        },
                        child: const Text("Let's Go!"),
                      ),
                    )
                  ],
                ),
              ),
              decoration: pageDecoration,
            ),
          ],
          showSkipButton: true,
          showNextButton: true,
          showDoneButton: false,
          skip: const Text("Skip"),
          next: const Icon(Icons.arrow_right_alt),
        ),
      ),
    );
  }
}
