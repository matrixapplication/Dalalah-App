import 'package:delala/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../bloc/exhibition_bloc.dart';
import 'exhibition_screen.dart';

class ExhibitionPage extends BaseBlocWidget<UnInitState, ExhibitionCubit> {
  ExhibitionPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    // bloc.fetchTasks();
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return ExhibitionScreen();
  }

  @override
  String? title(BuildContext context) {
    return "التجار و المعارض";
  }

}
