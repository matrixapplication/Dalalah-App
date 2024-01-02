import 'package:dalalah/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../data/models/add_rate_params.dart';
import '../../../domain/entities/showroom.dart';
import '../bloc/showrooms_details_bloc.dart';
import 'showroom_details_screen.dart';

class ShowroomDetailsPage
    extends BaseBlocWidget<DataSuccess<Showroom>, ShowroomDetailsCubit> {
  ShowroomDetailsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    int id = getArguments(context).id;
    bloc.fetchShowroomDetails(id);
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<Showroom> state) {
    return ExhibitionDetailsScreen(
      showroom: state.data ?? Showroom(),
      onAddRate: (rate) {
        bloc.addRateShowroom(AddRateParams(rate: rate, showroomId: state.data?.id));
      },
      onFollow: () {
        bloc.addFollowShowrooms(getArguments(context).id);
      },
    );
  }

  @override
  String? title(BuildContext context) {
    return "التجار و المعارض";
  }

  @override
  void onSuccessDismissed() {
    loadInitialData(context!);
  }
}
