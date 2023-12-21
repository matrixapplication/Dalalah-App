import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../favorites_and_ads/data/models/add_to_favorite_params.dart';
import '../../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../domain/use_cases/plates_usecase.dart';

@Injectable()
class PlatesDetailsCubit extends BaseCubit {
  final PlatesUseCase usecase;
  final FavoritesUseCase favoritesUseCase;

  PlatesDetailsCubit(this.usecase, this.favoritesUseCase);

  // fetchFavorites() async {
  //   executeSuccess(() => usecase.fetchPlates());
  // }

  toggleFavorite(int id) async {
    executeEmitterListener(() => favoritesUseCase.toggleFavoriteCarOrPlate(AddToFavoriteParams(plateId: id)));
  }

}
