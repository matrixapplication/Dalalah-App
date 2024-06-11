
import '../../../../core/network/api_response.dart';
import '../../../cars/data/models/add_special_params.dart';
import '../../data/models/ad_feature_dto.dart';
import '../../data/models/add_plate_params.dart';
import '../../data/models/plate_dto.dart';
import '../../data/models/plate_filter_params.dart';
import '../../data/models/update_plate_date_params.dart';

abstract class BasePlatesRepo {
  Future<ApiResponse<List<PlateDto>>> fetchPlates(PlateFilterParams params);
  Future<ApiResponse<PlateDto>> fetchPlateDetails(int id);
  Future<ApiResponse<int>> addPlate(AddPlateParams params);
  Future<ApiResponse<int>> editPlate(AddPlateParams params);
  Future<String> toggleFavoritePlate(int id);
  Future<ApiResponse<AdFeatureDto>> fetchAdFeature();
  Future<ApiResponse> hidePlate(int id);
  Future<ApiResponse> soldPlate(int id);
  Future<ApiResponse> addSpecialPlate(AdSpecialParams params);
  Future<ApiResponse> deletePlate(int id);
  Future<ApiResponse> updatePlateDate(UpdatePlateDateParams params);
}