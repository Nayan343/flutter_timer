import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/features/main/presentation/manager/timer/timer_bloc.dart';
import 'package:flutter_timer/features/main/presentation/widgets/timer_widget.dart';
import 'package:flutter_timer/injection_container.dart';

class TimerPage extends StatelessWidget {
  static const route = "/";

  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TimerBloc>(),
      child: const TimerWidget(),
    );
  }
}
