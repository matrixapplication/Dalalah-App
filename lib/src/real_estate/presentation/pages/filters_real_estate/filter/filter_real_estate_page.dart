
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../domain/entities/notification.dart';
import '../../../bloc/real_estate_bloc.dart';
import '../../real_estate_screen.dart';
import 'filter_real_estate_screen.dart';


class FilterRealEstatePage extends BaseBlocWidget<DataSuccess<List<Notifications>>, RealEstatePageCubit> {
  FilterRealEstatePage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchNotifications();
   }




   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Notifications>> state) {
   return FilterRealEstateScreen(
   );
  }

  @override
  String? title(BuildContext context) {
    return strings.detailed_research;
  }
}
