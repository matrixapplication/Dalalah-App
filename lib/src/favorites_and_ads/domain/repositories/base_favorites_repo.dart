
import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';
import '../../../plates/data/models/plate_dto.dart';
import '../../data/models/add_to_favorite_params.dart';
import '../../../real_estate/data/models/my_properties_response.dart';

abstract class BaseFavoritesRepo {

  // Cars APIs
  Future<ApiResponse<List<CarDto>>> fetchFavoriteCars(int page);
  Future<ApiResponse<bool>> toggleFavoriteCarOrPlate(AddToFavoriteParams params);
  Future<ApiResponse<List<CarDto>>> fetchMyCars(int page);

  // Plates APIs
  Future<ApiResponse<List<PlateDto>>> fetchFavoritePlates(int page);
  Future<ApiResponse<List<PlateDto>>> fetchMyPlates(int page);

  // Plates APIs
  Future<ApiResponse<List<Property>>> fetchMyRealEstate(int page);
}