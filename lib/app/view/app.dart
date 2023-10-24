import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iremovebreaklines/app/routes/router.dart';
import 'package:iremovebreaklines/utils/extensions/color_extension.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xFFECF8F8),
          foregroundColor: HexColor.fromHex('#333333'), // text color
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
