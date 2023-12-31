import 'package:flutter/material.dart';
import 'package:flutter_timer/features/main/presentation/pages/timer_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

sealed class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    debugPrint("${settings.name}");
    switch (settings.name) {
      case TimerPage.route:
        return _materialRoute(const TimerPage());
      default:
        return _materialRoute(const SizedBox());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
