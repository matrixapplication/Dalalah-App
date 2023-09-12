import 'package:injectable/injectable.dart';

import '../../../../main_index.dart';
import '../../../domain/use_cases/cars_usecase.dart';


@Injectable()
class CarsDetailsCubit extends BaseCubit {
  final CarsUseCase usecase;

  CarsDetailsCubit(this.usecase);

  Future<void> deliveryCollection() async {
    try {
      emit(LoadingStateListener());
      await usecase.deliveryCollection();
      emit(SuccessStateListener(''));
    }  catch (e) {
      emit(FailureStateListener(e));
    }
  }

  Future<void> rejectCollection() async {
    try {
      emit(LoadingStateListener());
      await usecase.rejectCollection();
      emit(SuccessStateListener(''));
    }  catch (e) {
      emit(FailureStateListener(e));
    }
  }

  Future<void> confirmCollectionProcess(String number) async {
    try {
      emit(LoadingStateListener());
      await usecase.confirmCollectionProcess(number);
      emit(SuccessStateListener(''));
    }  catch (e) {
      emit(FailureStateListener(e));
    }
  }
}
