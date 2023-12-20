import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../domain/use_cases/favorites_usecase.dart';

@Injectable()
class MyCarsCubit extends BaseCubit {
  final FavoritesUseCase usecase;

  MyCarsCubit(this.usecase);

  // StreamStateInitial<bool>  isFavorite = StreamStateInitial<bool>();


  List<Car> allCars = [];
  List<Car> cars = [];
  int page = 0;
  bool isLastPage = false;

  fetchMyCars({bool isMoreData = false}) async {
    !isMoreData ? {page = 1, allCars.clear()} : page++;
    print('page onSuccess$page');
    executeBuilder(
      isMoreData: isMoreData,
          () => usecase.fetchMyCars(page),
      onSuccess: (data) {
        isLastPage = (data.pagination?.totalPages)! <= page;
        cars = data.data?.map((e) => Car.fromDto(e)).toList() ?? [];
        if(cars.isEmpty){
          throw EmptyListException();
        } else {
          allCars.addAll(cars);
          emit(DataSuccess<List<Car>>(allCars));
        }
      },
    );
  }

}
