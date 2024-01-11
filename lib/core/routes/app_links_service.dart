import 'package:app_links/app_links.dart';
import 'package:dalalah/core/utils/constants.dart';

import '../../src/main_index.dart';
import '../utils/navigator.dart';

class AppLinkingService {
  static final _appLinks = AppLinks();

  static init() {
    _appLinks.allUriLinkStream.listen((uri) async {
      if (uri.path.isEmpty) return;
      try {
        String route = uri.path.split('/')[uri.pathSegments.length - 1];
        String id = uri.path.split('/').last;
        print('appLinks route id path $id');
        print('appLinks uri $route');
       //      await  pushNamed(route, arguments: int.parse(id));
      } on Exception catch (e) {
        pushNamed(Routes.navigationPages);
        print('appLinks error $e');
      }
    });
  }

  static goToRoute() async {
    try {
      final uri = await _appLinks.getInitialAppLink();
      if (uri == null) return;
      String route = uri.path.split('/')[uri.pathSegments.length - 1];
      String id = uri.path.split('/').last;
  //    await pushNamed(route, arguments: int.parse(id));
    } on Exception catch (e) {
      print('appLinks goToRoute error $e');
    }
  }

  static createDynamicLink(String route, {String? id}) {
    return '$kBaseUrl/$route/$id';
  }
}
