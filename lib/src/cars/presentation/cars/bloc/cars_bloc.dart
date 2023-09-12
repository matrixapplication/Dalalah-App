import 'package:injectable/injectable.dart';

import '../../../../main_index.dart';
import '../../../domain/entities/tasks.dart';
import '../../../domain/use_cases/cars_usecase.dart';


@Injectable()
class CarsCubit extends BaseCubit {
  final CarsUseCase usecase;

  CarsCubit(this.usecase);

  fetchTasks() async {
    try {
      emit(LoadingStateListener());
      final tasks = await usecase.fetchTasks();
      emit(DataSuccess<List<Task>>(tasks));
    }  catch (e) {
      emit(FailureStateListener(e));
    }
  }
}
