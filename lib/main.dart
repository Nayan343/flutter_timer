import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/config/routes.dart';
import 'package:flutter_timer/config/themes.dart';
import 'package:flutter_timer/bloc_event_observer.dart';
import 'package:flutter_timer/features/main/presentation/pages/timer_page.dart';
import 'package:flutter_timer/injection_container.dart';

Future<void> main() async {
  Bloc.observer = const BlocEventObserver();
  await injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      navigatorKey: navigatorKey,
      initialRoute: TimerPage.route,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
