import 'package:dalalah/core/resources/data_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../favorites_and_ads/data/models/add_to_favorite_params.dart';
import '../../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../domain/entities/plate.dart';
import '../../../domain/use_cases/plates_usecase.dart';

@Injectable()
class PlatesDetailsCubit extends BaseCubit {
  final PlatesUseCase usecase;
  final FavoritesUseCase favoritesUseCase;

  PlatesDetailsCubit(this.usecase, this.favoritesUseCase);

  fetchPlateDetails({Plate? plate, bool isRefresh = false}) async {
    if (isRefresh) {
      executeSuccess(() => usecase.fetchPlateDetails(plate?.id ?? 0));
    } else {
      emit(DataSuccess<Plate>(plate!));
    }
  }

  toggleFavorite(int id) async {
    executeEmitterListener(() => favoritesUseCase.toggleFavoriteCarOrPlate(AddToFavoriteParams(plateId: id)));
  }

}
