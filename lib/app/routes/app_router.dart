import 'package:cryptotracker/features/overview/presentation/screens/overview_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const ROOT = '/';
  static const OVERVIEW = 'overview';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROOT:
      case OVERVIEW:
        return MaterialPageRoute(builder: (context) => OverviewScreen());
      default:
        return null;
    }
  }
}
