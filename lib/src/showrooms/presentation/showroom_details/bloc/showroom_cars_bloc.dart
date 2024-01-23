import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../favorites_and_ads/data/models/add_to_favorite_params.dart';
import '../../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../price_requests/domain/use_cases/price_requests_usecase.dart';
import '../../../data/models/showroom_cars_params.dart';
import '../../../domain/use_cases/showrooms_usecase.dart';

@Injectable()
class ShowroomCarsCubit extends BaseCubit {
  final ShowroomsUseCase usecase;
  final FavoritesUseCase favoritesUseCase;
  final PriceRequestsUseCase priceRequestsUseCase;
  ShowroomCarsCubit(this.usecase, this.favoritesUseCase, this.priceRequestsUseCase);

  List<Car> allCars = [];
  List<Car> cars = [];
  ShowroomCarsParams params = ShowroomCarsParams();
  int page = 0;
  bool isLastPage = false;

  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  fetchShowroomCars(String status, int id, {bool isRefresh = true}) async {
    isRefresh ? {page = 1, allCars.clear()} : page++;
    executeBuilder(
      isRefresh: isRefresh,
          () => usecase.fetchShowroomCars(ShowroomCarsParams(page: page, status: status, id: id)),
      onSuccess: (data) {
        isLastPage = (data.pagination?.totalPages)! <= page;
        cars = data.data?.map((e) => Car.fromDto(e)).toList() ?? [];
        isLastPage ? refreshController.loadNoData() : refreshController.loadComplete();
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

  void requestCarPrice(int id) async {
    executeEmitterListener(() => priceRequestsUseCase.priceRequest(id));
  }

}
