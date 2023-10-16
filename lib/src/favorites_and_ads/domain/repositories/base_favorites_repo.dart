
import '../../../../core/network/api_response.dart';

abstract class BaseFavoritesRepo {
  Future<ApiResponse<List<String>>> fetchFavorites();
  Future<ApiResponse<String>> toggleFavorite(String id);
}