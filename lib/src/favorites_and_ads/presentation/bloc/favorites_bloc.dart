import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../domain/use_cases/favorites_usecase.dart';

@Injectable()
class FavoritesCubit extends BaseCubit {
  final FavoritesUseCase usecase;

  FavoritesCubit(this.usecase);

  // StreamStateInitial<bool>  isFavorite = StreamStateInitial<bool>();

  fetchFavorites() async {
    executeSuccess(() => usecase.fetchFavorites());
  }

  toggleFavorite(int id) async {
    executeEmitterSuccess(() => usecase.toggleFavorite(id));
  }

}
