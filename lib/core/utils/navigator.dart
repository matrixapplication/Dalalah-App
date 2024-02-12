import '../../src/main_index.dart';

Future<dynamic> pushNamed(String routeName, {dynamic arguments}) async {
  BuildContext context = injector<ServicesLocator>().appContext;
  print('routeName: $routeName');
  return Navigator.of(context).pushNamed(routeName, arguments: arguments);
}

Future<dynamic> pushNamedAndRemoveUntil(String routeName, {dynamic arguments}) {
  BuildContext context = injector<ServicesLocator>().appContext;
  print('routeName: $routeName');
  return Navigator.of(context).pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false,
          arguments: arguments);
}

Future<dynamic> push(Widget page) {
  BuildContext context = injector<ServicesLocator>().appContext;
  return Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

pop({dynamic arguments}) {
   injector<ServicesLocator>()
      .navigatorKey
      .currentState!
      .pop(arguments);
}

pushNameByUri(Uri uri) {
  return injector<ServicesLocator>()
      .navigatorKey
      .currentState!
      .pushNamed(uri.path, arguments: uri.queryParameters);
}

class Navigators {
  static GlobalKey<NavigatorState> navigationKey =
      injector<ServicesLocator>().navigatorKey;

  static Future<dynamic> pushNamed(String routeName,
      {dynamic arguments}) async {
    print('routeName: $routeName');
    return navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {dynamic arguments}) {
    return navigationKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  static Future<dynamic> pushReplacementNamed(String routeName,
      {dynamic arguments}) {
    return navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static void pop({dynamic result}) {
    return navigationKey.currentState!.pop(result);
  }

  static void goBackUntil(String routeName) {
    return navigationKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }
}
