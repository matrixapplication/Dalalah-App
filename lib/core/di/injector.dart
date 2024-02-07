import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../main.dart';
import 'injector.config.dart';

final injector = GetIt.instance;


@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async => await $initGetIt(injector);

class ServicesLocator{
  GlobalKey<NavigatorState> navigatorKey = navigatorMainKey;
  void init() {
    injector.registerLazySingleton(() => ServicesLocator());
    injector.registerLazySingleton(() => navigatorKey);
    // injector.registerLazySingleton(() => AppLocalizations.of(navigatorKey.currentContext!)!);
  }

  BuildContext get appContext => injector<ServicesLocator>().navigatorKey.currentContext!;

  AppLocalizations get strings => AppLocalizations.of(appContext)!;

  String get languageCode => appContext.locale.languageCode;
}