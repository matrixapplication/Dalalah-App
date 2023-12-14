import 'package:dalalah/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../bloc/showrooms_details_bloc.dart';
import 'showroom_details_screen.dart';

class ShowroomDetailsPage
    extends BaseBlocWidget<UnInitState, ShowroomDetailsCubit> {
  ShowroomDetailsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    // bloc.fetchTasks();
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return ExhibitionDetailsScreen(
      showrooms: [],
    );
  }

  @override
  String? title(BuildContext context) {
    return "التجار و المعارض";
  }
}
