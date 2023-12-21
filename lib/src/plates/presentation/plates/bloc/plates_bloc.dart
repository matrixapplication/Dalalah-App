import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../favorites_and_ads/data/models/add_to_favorite_params.dart';
import '../../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../data/models/plate_filter_params.dart';
import '../../../domain/use_cases/plates_usecase.dart';

@Injectable()
class PlatesCubit extends BaseCubit {
  final PlatesUseCase usecase;
  final FavoritesUseCase favoritesUseCase;

  PlatesCubit(this.usecase, this.favoritesUseCase);

  fetchPlates(PlateFilterParams params) async {
    executeSuccess(() => usecase.fetchPlates(params));
  }

  toggleFavorite(int id) async {
    executeEmitterListener(() => favoritesUseCase.toggleFavoriteCarOrPlate(AddToFavoriteParams(plateId: id)));
  }

}
