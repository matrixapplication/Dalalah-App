import 'package:delala/src/main_index.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

final injector = GetIt.instance;


@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async => await $initGetIt(injector);

class ServicesLocator{
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  void init() {
    injector.registerLazySingleton(() => ServicesLocator());
  }

  BuildContext get appContext => navigatorKey.currentContext!;

  AppLocalizations get strings => AppLocalizations.of(appContext)!;
}