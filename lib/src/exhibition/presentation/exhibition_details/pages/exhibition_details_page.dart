import 'package:dalalah/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../bloc/exhibition_details_bloc.dart';
import 'exhibition_details_screen.dart';

class ExhibitionDetailsPage
    extends BaseBlocWidget<UnInitState, ExhibitionDetailsCubit> {
  ExhibitionDetailsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    // bloc.fetchTasks();
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return ExhibitionDetailsScreen();
  }

  @override
  String? title(BuildContext context) {
    return "التجار و المعارض";
  }
}
