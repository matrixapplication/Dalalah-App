import 'package:app_links/app_links.dart';
import 'package:dalalah/core/utils/constants.dart';

import '../utils/navigator.dart';

class AppLinkingService {
  static final _appLinks = AppLinks();

  static init() {
    _appLinks.allUriLinkStream.listen((uri) {
      if (uri.path.isEmpty) return;
      String route = uri.path.split('/').last;
      String id = uri.pathSegments[1];
      print('appLinks route id path $id');
      print('appLinks uri $uri');
      pushNamed(route, arguments: int.parse(id));
    });
  }

  static goToRoute() async {
    final uri = await _appLinks.getInitialAppLink();
    if (uri == null) return;
    String route = uri.path.split('/').last ?? '';
    String id = uri.pathSegments[1];
    pushNamed(route, arguments: int.parse(id));
  }

  static createDynamicLink(String route, {String? id}) {
    return '$kBaseUrl/$route/$id';
  }
}
