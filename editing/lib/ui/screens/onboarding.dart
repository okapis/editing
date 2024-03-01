import 'package:editing/store/onboarding.dart';
import 'package:editing/ui/screens/onboarding/getting_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'onboarding/about.dart';
import 'onboarding/settings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  _OnboardingScreenState();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  Widget _createBackground() {
    return Opacity(
      opacity: 0.8,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/green.jpeg"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    OnboardingStore store = Provider.of<OnboardingStore>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Onboarding'),
      ),
      body: Observer(
        builder: (_) => Stepper(
          currentStep: store.currentStep,
          controlsBuilder: (BuildContext ctx, ControlsDetails dtl) {
            return Row(
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                  ),
                  onPressed: dtl.onStepContinue,
                  child: Text(store.isLastStep ? 'Finish' : 'Continue'),
                ),
                if (!store.isFirstStep)
                  TextButton(
                    onPressed: dtl.onStepCancel,
                    child: Text('Back'),
                  ),
              ],
            );
          },
          onStepContinue: store.continueStep,
          onStepCancel: store.cancelStep,
          steps: [
            Step(
              title: Text('Welcome'),
              subtitle: Text('Features overview'),
              content: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 200,
                    ),
                    child: Image(
                      image: AssetImage(
                          'assets/images/undraw_mobile_encryption_cl5q.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Html(
                        data:
                            "<h5>Fully encrypted</h5><br/><p>Everything inside Editing is fully encrypted with <strong>AES-256</strong> algorithm, it\'s theoretically impossible to decrypt without your master password.</p><p><a href=\"#\""
                            ">Learn more about security details</a></p>"),
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Step 2'),
              content: Text('Content for Step 2'),
            ),
            Step(
              title: Text('Step 3'),
              content: Text('Content for Step 3'),
            ),
          ],
        ),
      ),
    );
  }
}
