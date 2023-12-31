import 'package:flutter/material.dart';
import 'package:flutter_timer/features/main/presentation/widgets/action_buttons.dart';
import 'package:flutter_timer/features/main/presentation/widgets/back_ground.dart';
import 'package:flutter_timer/features/main/presentation/widgets/timer_text.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Stack(
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: TimerText()),
              ),
              ActionButtons(),
            ],
          ),
        ],
      ),
    );
  }
}

