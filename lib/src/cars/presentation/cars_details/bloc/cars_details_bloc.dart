import 'package:injectable/injectable.dart';

import '../../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../../main_index.dart';
import '../../../domain/use_cases/cars_usecase.dart';


@Injectable()
class CarsDetailsCubit extends BaseCubit {
  final CarsUseCase usecase;
  final FavoritesUseCase favoritesUseCase;

  CarsDetailsCubit(this.usecase, this.favoritesUseCase);

  Future<void> fetchCarDetails(int id) async {
    executeSuccess(() => usecase.fetchCarDetails(id));
  }

  Future<void> toggleFavorite(int id) async {
    executeEmitterListener(() => favoritesUseCase.toggleFavorite(id));
  }
}
