
import '../../../../core/network/api_response.dart';
import '../../../cars/data/models/add_special_params.dart';
import '../../data/models/ad_feature_dto.dart';
import '../../data/models/add_plate_params.dart';
import '../../data/models/plate_dto.dart';
import '../../data/models/plate_filter_params.dart';

abstract class BasePlatesRepo {
  Future<ApiResponse<List<PlateDto>>> fetchPlates(PlateFilterParams params);
  Future<int> addPlate(AddPlateParams params);
  Future<int> editPlate(AddPlateParams params);
  Future<String> toggleFavoritePlate(int id);
  Future<ApiResponse<AdFeatureDto>> fetchAdFeature();
  Future<ApiResponse> hidePlate(int id);
  Future<ApiResponse> soldPlate(int id);
  Future<ApiResponse> addSpecialPlate(AdSpecialParams params);
}