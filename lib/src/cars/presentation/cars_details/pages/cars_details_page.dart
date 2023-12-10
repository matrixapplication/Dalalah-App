
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../home/data/models/car_filter_params.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/car_details.dart';
import '../../cars/bloc/cars_bloc.dart';
import 'cars_details_screen.dart';

class CarsDetailsPage extends BaseBlocWidget<DataSuccess<CarDetails>, CarsCubit>{
  CarsDetailsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCars(CarFilterParams());
  }

  @override
  String? title(context) => strings.car_details;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<CarDetails> state) {
    bool? isNew = getArguments(context) as bool?;
    return CarsDetailsScreen(
      isNew: isNew ?? true,
      tasks: state.data!,
    );
  }

  //
  //
  // @override
  // Widget? bottomNavigationBar(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     decoration: Decorations.shapeTopShadow(
  //       color: context.scaffoldBackgroundColor,
  //       colorShadow: context.disabledColor,
  //       radius: 0,
  //     ),
  //     child: const ContactSocialButtons(
  //       phone: '+201141475581',
  //     ),
  //   );
  // }

}
