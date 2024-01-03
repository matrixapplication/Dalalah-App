
import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/plates/presentation/add_plate/pages/plate_filter_screen.dart';
import 'package:dalalah/src/sell_car/domain/entities/city.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../bloc/add_plate_bloc.dart';


class AddPlatesPage extends BaseBlocWidget<DataSuccess<List<City>>, AddPlateCubit> {
  AddPlatesPage({Key? key}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCities();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<City>> state) {
    return PlateFilterScreen(
      cities: state.data ?? [],
      onSelected: (params) {
        // bloc.addPlate(params);
        pushNamed(Routes.addPlatePremiumPage, arguments: params);
      },
    );
  }

  // @override
  // void onSuccessDismissed() {
  //   Navigators.pushNamed(Routes.addCarPremiumPage);
  // }

  @override
  String? title(BuildContext context) {
    bool? isAddPage = getArguments(context) ?? false;
    return isAddPage ? strings.add_plate : strings.detailed_research;
  }

}
