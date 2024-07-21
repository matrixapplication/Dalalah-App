import 'package:dalalah/core/utils/navigator.dart';
import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../main_index.dart';
import '../../../../data/models/add_real_estate_params.dart';
import '../../bloc/add_real_estate_bloc.dart';
import 'add_images_real_estate.dart';


class AddImageRealEstatePage extends BaseBlocWidget<UnInitState, AddRealEstatePageCubit> {
  AddImageRealEstatePage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchRealEstateCategories();
   }


   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
   return AddImagesRealEstateScreen(
     onShare: (param){
       AddRealEstateParams oldParams=getArguments(context)['param'];
       AddRealEstateParams addRealEstateParams=AddRealEstateParams(
         cover: param.cover,
         images: param.images,
         features: oldParams.features,
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
       print('yehya s ${addRealEstateParams.toJson().toString()}');
        bloc.addRealEstate(addRealEstateParams);
     }, categoryName: getArguments(context)['categoryName']
   );
  }


}
