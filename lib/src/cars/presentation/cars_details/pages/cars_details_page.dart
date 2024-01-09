
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/widgets/buttons/share_icon_button.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/car_details.dart';
import '../bloc/cars_details_bloc.dart';
import 'cars_details_screen.dart';

class CarsDetailsPage extends BaseBlocWidget<DataSuccess<CarDetails>, CarsDetailsCubit>{
  CarsDetailsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    int? id = getArguments(context) as int?;
    bloc.fetchCarDetails(id ?? 0);
  }

  @override
  String? title(context) => strings.car_details;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<CarDetails> state) {
    return CarsDetailsScreen(
      isNew: true,
      carDetails: state.data!,
      onToggleFavorite: () {
        bloc.toggleFavorite(state.data?.car?.id ?? 0);
      },
    );
  }

  @override
  List<Widget> actions() {
    int? id = getArguments(context!) as int?;
    return [ShareIconButton(
      padding: 15.paddingAll,
      route: Routes.carAppLink,
      id: id?.toString() ?? '',
      iconColor: context?.cardColor,
      isDecoration: false,
    )];
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
