import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../../core/resources/data_state.dart';
import '../../../../../../core/commen/common_state.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../../../core/utils/navigator.dart';
import '../../../../data/models/add_real_estate_params.dart';
import '../../../../data/models/category_details_dto.dart';
import '../../../../domain/entities/real_estate.dart';
import '../../bloc/add_real_estate_bloc.dart';
import 'feature_real_estate_screen.dart';


class FeatureRealEstatePage extends BaseBlocWidget<UnInitState,AddRealEstatePageCubit> {
  FeatureRealEstatePage({Key? key,}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     // StreamStateInitial<RealEstateCategoryDetailsDto?> categoryDetailsDto= getArguments(context);

     // bloc.fetchRealEstateCategoriesDetails(5);
   }




   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return FeatureRealEstateScreen(
      onTapNext: (param){
        AddRealEstateParams oldParams=getArguments(context)['param'];
        AddRealEstateParams addRealEstateParams=AddRealEstateParams(
          features: param.features,
          type: oldParams.type,
          status: oldParams.status,
          categoryId: oldParams.categoryId,
          detailsList: oldParams.detailsList,
          price: oldParams.price,
          description: oldParams.description,
          cityId: oldParams.cityId,
          streetName: oldParams.streetName,
          lat: oldParams.lat,
          lng:oldParams.lng,
        );
        pushNamed(Routes.addImageRealEstatePage,arguments:
        {
          'param': addRealEstateParams,
          'categoryName': getArguments(context)['categoryName'],
        });
      },
      categoriesDetails:  getArguments(context)['categoriesDetails'],
      categoryName:getArguments(context)['categoryName'],);
  }
}
