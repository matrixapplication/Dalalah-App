
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/core/routing/routes.dart';
import 'package:arabitac/main.dart';
import 'package:easy_localization/easy_localization.dart' as el;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/resources/theme/theme.dart';
import 'core/routing/navigation_services.dart';
import 'core/routing/route_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    appContext = context;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: primaryColorDark
    ));
    return MaterialApp(
      theme: lightTheme,
      color: Theme.of(context).scaffoldBackgroundColor,
      // localizationsDelegates: [
      //   ...context.localizationDelegates,
      // ],
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      title: 'Arabitac',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigationKey,
      initialRoute: Routes.init,
      onGenerateRoute: RouteGenerator.generateBaseRoute,
      builder: (context, child) => Directionality(
        textDirection:  TextDirection.ltr,
        child: child ?? const SizedBox(),
      ),
    );
  }
}
