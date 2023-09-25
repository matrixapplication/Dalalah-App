
import 'package:arabitac/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../domain/entities/tasks.dart';
import '../bloc/cars_bloc.dart';
import 'cars_screen.dart';

class CarsPage extends BaseBlocWidget<DataSuccess<List<Task>>, CarsCubit>{
  CarsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchTasks();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Task>> state) {
    return CarsScreen(
      isFilter: gerArguments(context)?.paramsFilter == null,
      tasks: state.data ?? [],
    );
  }

  @override
  String? title(BuildContext context) {
    return gerArguments(context)?.categoryName;
  }

  CarsPageArgs? gerArguments(BuildContext context){
    return ModalRoute.of(context)?.settings.arguments as CarsPageArgs?;
  }
}

class CarsPageArgs{
  final String? paramsFilter;
  final String? categoryName;
  final String? categoryID;

  CarsPageArgs({this.paramsFilter, this.categoryName, this.categoryID
  });
}