import 'package:injectable/injectable.dart';

import '../../../../favorites_and_ads/data/models/add_to_favorite_params.dart';
import '../../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../../main_index.dart';
import '../../../../price_requests/domain/use_cases/price_requests_usecase.dart';
import '../../../domain/use_cases/cars_usecase.dart';


@Injectable()
class CarsDetailsCubit extends BaseCubit {
  final CarsUseCase usecase;
  final FavoritesUseCase favoritesUseCase;
  final PriceRequestsUseCase priceRequestsUseCase;
  CarsDetailsCubit(this.usecase, this.favoritesUseCase, this.priceRequestsUseCase);

  Future<void> fetchCarDetails(int id) async {
    executeSuccess(() => usecase.fetchCarDetails(id));
  }

  Future<void> toggleFavorite(int id) async {
    executeEmitterListener(() => favoritesUseCase.toggleFavoriteCarOrPlate(AddToFavoriteParams(carId: id)));
  }

  void requestPrice(int id) async {
    executeEmitterListener(() => priceRequestsUseCase.priceRequest(id));
  }
}
