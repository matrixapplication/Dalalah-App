import 'package:dalalah/src/main_index.dart';
import 'package:dalalah/src/showrooms/domain/entities/showroom.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../bloc/showrooms_bloc.dart';
import 'showrooms_screen.dart';

class ShowroomsPage extends BaseBlocWidget<DataSuccess<List<Showroom>>, ShowroomsCubit> {
  ShowroomsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchShowrooms();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Showroom>> state) {
    return ShowroomsScreen();
  }

  @override
  String? title(BuildContext context) {
    return getArguments(context) ?? strings.exhibitions;
  }

}
