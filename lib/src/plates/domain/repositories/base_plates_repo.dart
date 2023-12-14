
import '../../../../core/network/api_response.dart';
import '../../data/models/add_plate_params.dart';
import '../../data/models/plate_dto.dart';

abstract class BasePlatesRepo {
  Future<ApiResponse<List<PlateDto>>> fetchFavorites();
  Future<String> addPlate(AddPlateParams params);
  Future<String> toggleFavoritePlate(int id);

}