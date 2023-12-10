
import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';

abstract class BaseFavoritesRepo {
  Future<ApiResponse<List<CarDto>>> fetchFavorites();
  Future<ApiResponse<bool>> toggleFavorite(int id);
}