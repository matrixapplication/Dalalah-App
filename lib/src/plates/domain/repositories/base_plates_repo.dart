
import '../../../../core/network/api_response.dart';

abstract class BasePlatesRepo {
  Future<ApiResponse<List<String>>> fetchFavorites();
  Future<ApiResponse<String>> toggleFavorite(String id);
}