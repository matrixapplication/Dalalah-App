import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/src/real_estate/presentation/real_estate/pages/real_estate_details/real_estate_details_screen.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../data/models/add_real_estate_params.dart';
import '../../bloc/real_estate_bloc.dart';
class RealEstateDetailsPage extends BaseBlocWidget<UnInitState, RealEstatePageCubit> {
  RealEstateDetailsPage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {

     bloc.fetchRealEstates(
         AddRealEstateParams(
           type: 'sell',
           status: 'rent',
         )
     );
   }



   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
   return RealEstateDetailsScreen(
     realEstate: getArguments(context),
   );
  }


}
