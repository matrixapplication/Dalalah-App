
import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/plates/presentation/add_plate/pages/plate_filter_screen.dart';
import 'package:dalalah/src/sell_car/domain/entities/city.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/plate_args.dart';
import '../bloc/add_plate_bloc.dart';


class AddPlatesPage extends BaseBlocWidget<DataSuccess<List<City>>, AddPlateCubit> {
  AddPlatesPage({Key? key}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCities();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<City>> state) {
    return TextFormField();
  }

  // @override
  // void onSuccessDismissed() {
  //   Navigators.pushNamed(Routes.addCarPremiumPage);
  // }

  @override
  String? title(BuildContext context) {
    PlateArgs? args = getArguments(context) ?? PlateArgs();
    return args!.isFilter ? strings.detailed_research : args.isEdit ? strings.edit_plate : strings.add_plate;
  }

}
