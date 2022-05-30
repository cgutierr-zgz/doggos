import 'package:doggos/app/app.dart';
import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final _navigator = AppRouter.router();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: _navigator.routerDelegate,
      routeInformationParser: _navigator.routeInformationParser,
    );
  }
}
