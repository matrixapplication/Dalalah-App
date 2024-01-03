import 'package:dalalah/src/auth/presentation/pages/login/login_page.dart';
import 'package:dalalah/src/home/presentation/pages/home_page.dart';
import 'package:dalalah/src/sell_car/data/repositories/add_car_repo.dart';
import 'package:dalalah/src/settings/presentation/bloc/locale_cubit.dart';
import 'package:dalalah/src/settings/presentation/bloc/locale_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';

import 'core/themes/light_theme.dart';
import 'core/network/base_client.dart';
import 'core/utils/helper_methods.dart';
import 'src/main_index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String token = await HelperMethods.getToken();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await configureDependencies();

  ServicesLocator().init();
  injector.registerSingleton(ClientCreator(
      interceptor: HeaderInterceptor(
    accessToken: token,
  )).create());
  injector.registerSingleton(AddCarRepo(injector()));
  runApp(
    MyApp(token: token),
    //   DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(token: token), // Wrap your app
    // ),
  );
}

class MyApp extends StatelessWidget {
  final String token;

  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    // FirebaseNotification firebase = FirebaseNotification();
    // firebase.initialize(context);
    return BlocProvider(
      create: (BuildContext context) => LocaleCubit()..getLanguageData(),
      child: BlocBuilder<LocaleCubit, LocalState>(
        // bloc: LocaleCubit()..getLanguageData(),
        builder: (context, state) {
          print('state.language ${state.language}');
          return MaterialApp(
            theme: lightTheme,
            debugShowCheckedModeBanner: false,
            navigatorKey: injector<ServicesLocator>().navigatorKey,
            locale: Locale(state.language),
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
            // routerConfig: router,
            routes: Routes.routes,
            initialRoute: token.isEmpty ? Routes.login : Routes.navigationPages,
          );
        },
      ),
    );
  }
}


// final router = GoRouter(
//     navigatorKey: injector<ServicesLocator>().navigatorKey,
//     routes: [
//   GoRoute(
//     path: '/',
//     name: 'homePage',
//     pageBuilder: (context, state) {
//       return const MaterialPage(child: Scaffold(
//         body: Center(
//           child: Text('Home Page'),
//         ),
//       ));
//     },
//   ),
//   GoRoute(
//     path: '/test',
//     pageBuilder: (context, state) {
//       return MaterialPage(child: HomePage());
//     },
//   ),
// ]);
