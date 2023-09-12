import 'package:arabitac/src/main_index.dart';

import 'common_appbar.dart';


PreferredSizeWidget notificationsPageAppbar() {
  bool userConnected = true;
  return commonAppBar(
    title: const Text("الاشعارات"),
    appbarColor: AppColors.appBackgroundColorBlack,
    appbarTitleColor: AppColors.appTextColorWhite,
  );
}
