

import 'package:dalalah/src/real_estate/presentation/properties_developers/pages/properties_developers_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../../core/widgets/pagination/pagination_widget.dart';
import '../../../data/models/properties_developers.dart';
import '../bloc/properties_developers_bloc.dart';

class PropertiesDevelopersPage extends BaseBlocWidget<DataSuccess<List<PropertiesDevelopers>>,PropertiesDevelopersPageCubit> {
  PropertiesDevelopersPage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchPropertiesDevelopers();
   }
  RefreshController controller = RefreshController(initialRefresh: false);
  ScrollController scrollController = ScrollController();
  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<PropertiesDevelopers>> state) {

   return
     PaginationWidget(
       refreshController: controller,
       onRefresh: () {
         loadInitialData(context);
         controller.refreshCompleted();
       },
       onLoading: () async {
         await bloc.fetchPropertiesDevelopers(isRefresh: false);
         await Future.delayed(const Duration(milliseconds: 1200));
         if (bloc.propertiesDevelopers.isEmpty) {
           controller.loadNoData();
         } else {
           controller.loadComplete();
         }
       },
       child:  PropertiesDevelopersScreen(
       developers: state.data??[],
     ));


  }

}
