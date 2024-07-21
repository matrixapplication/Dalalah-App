import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../core/utils/navigator.dart';
import '../../../../../main_index.dart';
import '../../../../../sell_car/domain/entities/city.dart';
import '../../../../data/models/add_real_estate_params.dart';
import '../../../../data/models/category_details_dto.dart';
import '../../../../domain/entities/real_estate_args.dart';
import '../../bloc/add_real_estate_bloc.dart';
import '../add_real_estate/add_real_estate_screen.dart';
import 'add_real_estate_second_screen.dart';

class AddRealEstateSecondPage
    extends BaseBlocWidget<DataSuccess<List<City>>, AddRealEstatePageCubit> {
  AddRealEstateSecondPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCities();
  }

  @override
  Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<City>> state) {
    RealEstateArgs args = getArguments(context);
    return AddRealStateSecondScreen(
      categoryName: args.categoryName,
      categoryDetailsDto: args.categoryDetailsDto,
      citiesList: state.data!,
      onTapNext: (param) {
        AddRealEstateParams newParams = args.addRealEstateParams;
        newParams.price = param.price;
        newParams.description = param.description;
        newParams.cityId = param.cityId;
        newParams.streetName = param.streetName;
        newParams.lat = param.lat;
        newParams.lng = param.lng;

        args.addRealEstateParams = newParams;
        pushNamed(
          Routes.featureRealEstatePage,
          arguments: args,
        );
      },
    );
  }
}
