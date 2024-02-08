
import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/widgets/buttons/share_icon_button.dart';

import '../../../../main_index.dart';
import '../../../domain/entities/plate.dart';
import '../bloc/plates_details_bloc.dart';
import 'plates_details_screen.dart';


class SharePlateDetailsPage extends BaseBlocWidget<DataSuccess<Plate>, PlatesDetailsCubit> {
  SharePlateDetailsPage({Key? key}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    int id = getArguments(context);
    bloc.fetchFavorites(id);
  }


  @override
  String? title(context)=> strings.plates;

  int id = 0;
  @override
  Widget buildWidget(BuildContext context, DataSuccess<Plate> state) {
    id = state.data?.id ?? 0;
    return PlatesDetailsScreen(
        plate: state.data!,
      onToggleFavorite: () => bloc.toggleFavorite(state.data?.id ?? 0),
    );
  }

  @override
  List<Widget> actions() {
    return [ShareIconButton(
      padding: 15.paddingAll,
      route: Routes.plateAppLink,
      id: id.toString(),
      iconColor: context?.cardColor,
      isDecoration: false,
    )];
  }
}
