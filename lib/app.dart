import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:worldline_flutter/di/di.dart';
import 'package:worldline_flutter/ui/navigation/main_navigator.dart';
import 'package:worldline_flutter/ui/styles/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Worldline Flutter',
      theme: themeData,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: getIt<MainNavigator>().router,
    );
  }
}
