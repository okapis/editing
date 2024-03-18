import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

import '../widgets/activity.dart';
import '../widgets/task.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  SMITrigger? _trigger;

  void _hitBite() => _trigger?.fire();

  late StateMachineController _controller;

  void _onRiveInit(Artboard artboard) {
    var ctrl = StateMachineController.fromArtboard(artboard, 'State Machine 1')
        as StateMachineController;
    ctrl.isActive = true;
    artboard.addController(ctrl);
    _trigger = ctrl.findInput<bool>('bite') as SMITrigger;
    setState(() {
      _controller = ctrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Welcome, my lord! Today is 25th, May. You have 2 pending tasks to complete.",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 200,
            width: 400,
            child: GestureDetector(
              child: RiveAnimation.asset(
                'assets/hippo.riv',
                fit: BoxFit.cover,
                onInit: _onRiveInit,
              ),
              onTap: _hitBite,
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: "Ask me anything",
              suffixIcon: Icon(
                Icons.send_outlined,
                color: Colors.indigo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
