import 'package:dalalah/src/main_index.dart';

import 'common_appbar.dart';


PreferredSizeWidget billsPageAppbar() {
  bool userConnected = true;
  return commonAppBar(
    title: const Text("الفواتير"),
    appbarColor: AppColors.appBackgroundColorBlack,
    appbarTitleColor: AppColors.appTextColorWhite,
  );
}
