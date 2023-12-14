import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../domain/use_cases/plates_usecase.dart';

@Injectable()
class PlatesDetailsCubit extends BaseCubit {
  final PlatesUseCase usecase;

  PlatesDetailsCubit(this.usecase);

  fetchFavorites() async {
    executeSuccess(() => usecase.fetchPlates());
  }

  toggleFavorite(int id) async {
    executeEmitterListener(() => usecase.toggleFavoritePlate(id));
  }

}
