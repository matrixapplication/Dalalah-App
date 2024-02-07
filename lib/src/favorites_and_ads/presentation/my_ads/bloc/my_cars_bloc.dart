import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../cars/data/models/add_special_params.dart';
import '../../../../cars/domain/use_cases/cars_usecase.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../plates/domain/entities/ad_types.dart';
import '../../../domain/use_cases/favorites_usecase.dart';

@Injectable()
class MyCarsCubit extends BaseCubit {
  final FavoritesUseCase usecase;
  final CarsUseCase carsUseCase;

  MyCarsCubit(this.usecase, this.carsUseCase);

  // StreamStateInitial<bool>  isFavorite = StreamStateInitial<bool>();


  List<Car> allCars = [];
  List<Car> cars = [];
  int page = 0;
  bool isLastPage = false;

  fetchMyCars({bool isRefresh = true}) async {
    isRefresh ? {page = 1, allCars.clear()} : page++;
    print('page onSuccess$page');
    executeBuilder(
      isRefresh: isRefresh,
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

  void hideCar(int id) async {
    executeEmitterListener(() => carsUseCase.hideCar(id));
  }

  void soldCar(int id) async {
    executeEmitterListener(() => carsUseCase.soldCar(id));
  }

  void addSpecialCar(int id) async {
    executeEmitterListener(() => carsUseCase.addSpecialCar(AdSpecialParams(id: id, type: AdTypes.featured)));
  }

}
