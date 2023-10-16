
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../repositories/base_favorites_repo.dart';

@Injectable()
class FavoritesUseCase {
  final BaseFavoritesRepo repository;

  FavoritesUseCase(this.repository);

  Future<List<String>> fetchFavorites() async {
   // final data = (await repository.fetchFavorites());
    return ['', '','', '','', '','', ''];
  }

  Future<ApiResponse<String>> toggleFavorite(String id) async {
    return await repository.toggleFavorite(id);
  }
}