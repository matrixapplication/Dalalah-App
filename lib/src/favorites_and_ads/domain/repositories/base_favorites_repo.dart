
import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';
import '../../data/models/add_to_favorite_params.dart';

abstract class BaseFavoritesRepo {

  // Cars APIs
  Future<ApiResponse<List<CarDto>>> fetchFavoriteCars(int page);
  Future<ApiResponse<bool>> toggleFavoriteCar(AddToFavoriteParams params);
  Future<ApiResponse<List<CarDto>>> fetchMyCars(int page);

  // Plates APIs
  Future<ApiResponse<List<CarDto>>> fetchFavoritePlates(int page);
  Future<ApiResponse<List<CarDto>>> fetchMyPlates(int page);
  Future<ApiResponse<bool>> toggleFavoritePlate(AddToFavoriteParams params);
}