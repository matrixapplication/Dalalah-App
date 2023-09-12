import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../domain/use_cases/favorites_usecase.dart';

@Injectable()
class FavoritesCubit extends BaseCubit {
  final FavoritesUseCase usecase;

  FavoritesCubit(this.usecase);

  fetchFavorites() async {
    executeSuccess(() => usecase.fetchFavorites());
  }

  toggleFavorite(String id) async {
    executeEmitterListener(() => usecase.toggleFavorite(id));
  }

}
