import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../favorites_and_ads/data/models/add_to_favorite_params.dart';
import '../../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../data/models/showroom_cars_params.dart';
import '../../../domain/use_cases/showrooms_usecase.dart';

@Injectable()
class ShowroomCarsCubit extends BaseCubit {
  final ShowroomsUseCase usecase;
  final FavoritesUseCase favoritesUseCase;
  ShowroomCarsCubit(this.usecase, this.favoritesUseCase);

  List<Car> allCars = [];
  List<Car> cars = [];
  ShowroomCarsParams params = ShowroomCarsParams();
  int page = 0;
  bool isLastPage = false;

  fetchMyCars(String status, int id, {bool isMoreData = false}) async {
    !isMoreData ? {page = 1, allCars.clear()} : page++;
    executeBuilder(
      isMoreData: isMoreData,
          () => usecase.fetchShowroomCars(ShowroomCarsParams(page: page, status: status, id: id)),
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

  toggleCarFavorite(int id) async {
    executeEmitterListener(() => favoritesUseCase.toggleFavoriteCarOrPlate(AddToFavoriteParams(carId: id)));
  }

}
