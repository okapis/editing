import 'package:editing/store/onboarding.dart';
import 'package:editing/ui/screens/onboarding/getting_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

import 'onboarding/about.dart';
import 'onboarding/settings.dart';

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

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final onboardingPages = [
    PageViewModel(
        title: "Comprehensive Secret Protection",
        body:
            "eDiting SecureVault goes beyond passwords, providing comprehensive protection for all your sensitive information. Safely store and manage passwords, notes, photos, files, and more within our app's encrypted vault. Advanced algorithms like AES-256 and Argon2 ensure that your secrets remain secure and inaccessible to unauthorized individuals.",
        image: SvgPicture.asset(
          "assets/images/authentication-flatline-48804.svg",
        ),
        decoration: pageDecoration),
    PageViewModel(
      title: "Strong Encryption with AES-256 and Argon2",
      body:
          "Your secrets are encrypted with the highest level of security using AES-256 and Argon2. These industry-standard algorithms make it virtually impossible for anyone to decipher your encrypted data. Rest assured that your secrets are safe from brute-force and dictionary attacks, keeping them confidential and protected.",
      image: SvgPicture.asset(
        "assets/images/super-man-flatline.svg",
      ),
      decoration: pageDecoration,
    ),
    PageViewModel(
      title: "Cross-Platform Support",
      body:
          "Access and manage your secrets seamlessly across multiple platforms with eDiting SecureVault. Whether you're using iOS, Android, or desktop, our app synchronizes your encrypted data, ensuring that changes you make on one device are instantly reflected on all others. Enjoy a consistent and user-friendly experience, no matter which platform you're using.",
      image: SvgPicture.asset(
        "assets/images/idea-applications-outline.svg",
      ),
      decoration: pageDecoration,
    ),
    PageViewModel(
      title: "Getting Started",
      bodyWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
                "Access and manage your secrets seamlessly across multiple platforms with eDiting SecureVault. Whether you're using iOS, Android, or desktop, our app synchronizes your encrypted data, ensuring that changes you make on one device are instantly reflected on all others. Enjoy a consistent and user-friendly experience, no matter which platform you're using."),
            Icon(Icons.edit),
            Text(" to edit a post"),
          ],
        ),
      ),
      image: SvgPicture.asset(
        "assets/images/startup-flatline-0066b.svg",
      ),
      decoration: pageDecoration,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    OnboardingStore store = Provider.of<OnboardingStore>(context);

    return Scaffold(
      body: Observer(
        builder: (_) => IntroductionScreen(
          pages: onboardingPages,
          showSkipButton: true,
          showNextButton: false,
          showDoneButton: false,
          skip: const Text("Skip"),
          onDone: () {
            // On button pressed
          },
        ),
      ),
    );
  }
}
