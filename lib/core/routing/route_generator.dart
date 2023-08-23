
import 'package:arabitac/core/routing/routes.dart';
import 'package:arabitac/features/auth_features/feature_view_layer/login/login_screen.dart';
import 'package:arabitac/features/auth_features/feature_view_layer/register/register_screen.dart';
import 'package:arabitac/features/home_feature/feature_view_layer/home/home_screen.dart';
import 'package:arabitac/features/navigationbar/navigation_bar_screen.dart';
import 'package:arabitac/features/splash_onboarding_feature/view_layer/onboarding/onboarding_screen.dart';
import 'package:arabitac/features/splash_onboarding_feature/view_layer/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'platform_page_route.dart';
import 'undefined_route_screen.dart';

class RouteGenerator {
  static Route generateBaseRoute(RouteSettings settings) {
    return getRout(settings);
  }

  static Route getRout(RouteSettings settings) {
    if (settings.name == Routes.init) {
      return platformPageRoute(const SplashScreen());
    }
    if (settings.name == Routes.onBoarding) {
      return platformPageRoute(const OnBoardingScreen());
    }
    if (settings.name == Routes.login) {
      return platformPageRoute(const LoginScreen());
    }
    if (settings.name == Routes.register) {
      return platformPageRoute(const RegisterScreen());
    }
    if (settings.name == Routes.home) {
      return platformPageRoute(const HomeScreen());
    }
    if (settings.name == Routes.navigationBar) {
      return platformPageRoute( BottomNavigationPage());
    }
     else {
      return platformPageRoute(UndefinedRouteScreen(settings.name));
    }

    //return platformPageRoute(UndefinedRouteScreen(settings.name));
  }
}
