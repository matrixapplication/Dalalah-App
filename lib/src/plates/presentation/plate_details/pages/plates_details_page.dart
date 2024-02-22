
import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/widgets/buttons/share_icon_button.dart';
import 'package:dalalah/src/home/presentation/widgets/filter_home.dart';

import '../../../../../core/widgets/buttons/contact_social_buttons.dart';
import '../../../../main_index.dart';
import '../../../../sell_car/domain/entities/shipment.dart';
import '../../../domain/entities/plate.dart';
import '../bloc/plates_details_bloc.dart';
import 'plates_details_screen.dart';


class PlateDetailsPage extends BaseBlocWidget<DataSuccess<Plate>, PlatesDetailsCubit> {
  PlateDetailsPage({Key? key}) : super(key: key);

  dynamic plateOrId;
  @override
  void loadInitialData(BuildContext context) {
    // we check here because if come from app or from share link
     plateOrId = getArguments(context);
    bloc.fetchPlateDetails(plate: plateOrId is int ? Plate(id: plateOrId) : plateOrId, isRefresh: plateOrId is int);
  }


  @override
  String? title(context)=> strings.plates;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<Plate> state) {
    return PlatesDetailsScreen(
        plate: state.data ?? Plate(),
      onToggleFavorite: () => bloc.toggleFavorite(state.data?.id ?? 0),
    );
  }

  @override
  List<Widget> actions() {
    final plate = getArguments(context!);
    return [ShareIconButton(
      padding: 15.paddingAll,
      route: Routes.plateAppLink,
      id: plate is int ? plate.toString() : (plate as Plate).id.toString(),
      iconColor: context?.cardColor,
      isDecoration: false,
    )];
  }

  @override
  void onSuccessDismissed() {
    bloc.fetchPlateDetails(isRefresh: true, plate: plateOrId is int ? Plate(id: plateOrId) : plateOrId);
  }
}
