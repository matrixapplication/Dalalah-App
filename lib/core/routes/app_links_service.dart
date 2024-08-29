import 'package:app_links/app_links.dart';
import 'package:dalalah/core/utils/constants.dart';
import 'package:dalalah/main.dart';

import '../../src/main_index.dart';
import '../utils/navigator.dart';

class AppLinkingService {
  static  AppLinks _appLinks = AppLinks();

  // static Future<void> initDeepLinks() async {
  //   _appLinks = AppLinks();
  //
  //   // Check initial link if app was in cold state (terminated)
  //   final appLink = await _appLinks.getInitialAppLink();
  //   if (appLink != null) {
  //     print('getInitialAppLink: $appLink');
  //     openAppLink(appLink);
  //   }
  //
  //   // Handle link when app is in warm state (front or background)
  //     _appLinks.uriLinkStream.listen((uri) {
  //     print('onAppLink: $uri');
  //     openAppLink(uri);
  //   });
  // }
  //
  // static void openAppLink(Uri uri) {
  //   // pushNamed(uri.fragment);
  // }

  static init() {
    goToRoute();  // Check initial link if app was in cold state (terminated)

    // Handle link when app is in warm state (front or background)
    _appLinks.uriLinkStream.listen((uri) async {
      if (uri.path.isEmpty) return;
      try {
        String route = uri.path.split('/')[uri.pathSegments.length - 1];
        String id = uri.path.split('/').last;
        print('appLinks route id path $id');
        print('appLinks uri $route');
              pushNamed(route, arguments: int.parse(id));

      } on Exception catch (e) {
        pushNamed(Routes.navigationPages);
        print('appLinks error $e');
      }
    });
  }
  //
  static goToRoute() async {
    try {
      final uri = await _appLinks.getInitialAppLink();
      if (uri == null) return;
      String route = uri.path.split('/')[uri.pathSegments.length - 1];
      String id = uri.path.split('/').last;
      print('appLinks route id path $id');
      print('appLinks uri $route');
      await pushNamed(route, arguments: int.parse(id));
      //محتاج اربط لو في id  اجيب التفاصيل ب api جديد
    } on Exception catch (e) {
      print('appLinks goToRoute error $e');
    }
  }

  static String createDynamicLink(String route, {String? id}) {
    print('ffff ${'${getLink()}/$route/$id'}');
    return '${getLink()}/$route/$id';
  }

  static String getLink() {
    return kBaseUrl.replaceAll('/api', '');
  }
}
