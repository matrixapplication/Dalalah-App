
import '../../../../core/network/api_response.dart';
import '../../data/models/add_plate_params.dart';
import '../../data/models/plate_dto.dart';
import '../../data/models/plate_filter_params.dart';

abstract class BasePlatesRepo {
  Future<ApiResponse<List<PlateDto>>> fetchPlates(PlateFilterParams params);
  Future<String> addPlate(AddPlateParams params);
  Future<String> toggleFavoritePlate(int id);

}