
import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/widgets/buttons/share_icon_button.dart';
import 'package:dalalah/src/home/presentation/widgets/filter_home.dart';

import '../../../../../core/widgets/buttons/contact_social_buttons.dart';
import '../../../../main_index.dart';
import '../../../../sell_car/domain/entities/shipment.dart';
import '../../../domain/entities/plate.dart';
import '../bloc/plates_details_bloc.dart';
import 'plates_details_screen.dart';


class PlatesDetailsPage extends BaseBlocWidget<UnInitState, PlatesDetailsCubit> {
  PlatesDetailsPage({Key? key}) : super(key: key);


  // @override
  // void loadInitialData(BuildContext context) {
  //   bloc.fetchFavorites();
  // }


  @override
  String? title(context)=> strings.plates;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    Plate plate = getArguments(context);
    return PlatesDetailsScreen(
        plate: plate,
      onToggleFavorite: () => bloc.toggleFavorite(plate.id ?? 0),
    );
  }

  @override
  List<Widget> actions() {
    Plate plate = getArguments(context!);
    return [ShareIconButton(
      padding: 15.paddingAll,
      route: Routes.plateAppLink,
      id: plate.id?.toString() ?? '',
      iconColor: context?.cardColor,
      isDecoration: false,
    )];
  }
}
