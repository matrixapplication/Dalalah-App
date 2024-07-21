import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../core/utils/navigator.dart';
import '../../../../../main_index.dart';
import '../../../../../sell_car/domain/entities/city.dart';
import '../../../../data/models/add_real_estate_params.dart';
import '../../../../data/models/category_details_dto.dart';
import '../../bloc/add_real_estate_bloc.dart';
import '../add_real_estate/add_real_estate_screen.dart';
import 'add_real_estate_second_screen.dart';


class AddRealEstateSecondPage extends BaseBlocWidget<DataSuccess<List<City>>, AddRealEstatePageCubit> {
  AddRealEstateSecondPage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
      bloc.fetchCities();
   }


   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<City>> state) {
   return AddRealStateSecondScreen(
     categoryName: getArguments(context)['categoryName'],
     categoryDetailsDto: getArguments(context)['categoriesDetails'],
     citiesList:state.data!,
     onTapNext: (param){

       AddRealEstateParams oldParams=getArguments(context)['param'];
       AddRealEstateParams addRealEstateParams=AddRealEstateParams(
         type: oldParams.type,
         status: oldParams.status,
         categoryId: oldParams.categoryId,
         detailsList: oldParams.detailsList,
         price: param.price,
         description: param.description,
         cityId: param.cityId,
         streetName: param.streetName,
         lat: param.lat,
         lng:param.lng,
       );

        pushNamed(Routes.featureRealEstatePage,arguments: {
          'categoriesDetails':getArguments(context)['categoriesDetails'],
          'param':addRealEstateParams,
          'categoryName':getArguments(context)['categoryName'],
        });
     },
   );
  }


}
