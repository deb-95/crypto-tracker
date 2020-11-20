import 'package:cryptotracker/app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CryptoTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [Locale('en'), Locale('it')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: Builder(
        builder: (context) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Crypto Tracker',
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
