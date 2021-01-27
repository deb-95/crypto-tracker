import 'package:cryptotracker/features/detail/presentation/screens/detail_screen.dart';
import 'package:cryptotracker/features/detail/presentation/screens/detail_screen_arguments.dart';
import 'package:cryptotracker/features/overview/presentation/screens/overview_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const ROOT = '/';
  static const OVERVIEW = 'overview';
  static const DETAIL = 'detail';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROOT:
      case OVERVIEW:
        return MaterialPageRoute(builder: (context) => OverviewScreen());
      case DETAIL:
        DetailScreenArguments args = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => DetailScreen(
            coin: args.coin,
            name: args.name
          ),
        );
      default:
        return null;
    }
  }
}
