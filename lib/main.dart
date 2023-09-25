
import 'package:arabitac/src/settings/presentation/bloc/locale_cubit.dart';
import 'package:arabitac/src/settings/presentation/bloc/locale_state.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/themes/light_theme.dart';
import 'core/network/base_client.dart';
import 'src/main_index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await configureDependencies();

  ServicesLocator().init();
  injector.registerSingleton(ClientCreator(
      interceptor: HeaderInterceptor(
        accessToken: '',
      )).create());
  runApp(DevicePreview(
    enabled: kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(500, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    // Use builder only if you need to use library outside ScreenUtilInit context
    builder: (_ , child) {
        return BlocProvider(
          create: (BuildContext context) =>
          LocaleCubit()
            ..getLanguageData(),
          child: BlocBuilder<LocaleCubit, LocalState>(
            // bloc: LocaleCubit()..getLanguageData(),
            builder: (context, state) {
              print('state.language ${state.language}');
              return MaterialApp(
                theme: lightTheme,
                debugShowCheckedModeBanner: false,
                locale: Locale(state.language),
                navigatorKey: injector<ServicesLocator>().navigatorKey,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'), // English, no country code
                  Locale('ar'), // Arabic, no country code
                ],
                routes: Routes.routes,
                initialRoute: Routes.login,
              );
            },
          ),
        );
      }
    );
  }
}
