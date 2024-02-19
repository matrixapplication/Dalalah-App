import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../cars/data/models/add_special_params.dart';
import '../../domain/repositories/base_plates_repo.dart';
import '../data_sources/plates_datasource.dart';
import '../models/ad_feature_dto.dart';
import '../models/add_plate_params.dart';
import '../models/plate_dto.dart';
import '../models/plate_filter_params.dart';

@Injectable(as: BasePlatesRepo)
class PlatesRepo extends BasePlatesRepo {
  final PlatesDatasource remoteDataSource;

  PlatesRepo(this.remoteDataSource);

  @override
  Future<ApiResponse<List<PlateDto>>> fetchPlates(PlateFilterParams params) async {
    return await remoteDataSource.fetchPlates(params);
  }

  @override
  Future<ApiResponse<PlateDto>> fetchPlateDetails(int id) async {
    return await remoteDataSource.fetchPlateDetails(id);
  }

  @override
  Future<String> toggleFavoritePlate(int id) async {
    final result = await remoteDataSource.toggleFavoritePlate(id);
    return result.message ?? '';
  }

  @override
  Future<ApiResponse<int>> addPlate(AddPlateParams params) async {
    final result = await remoteDataSource.addPlate(params);
    return result;
  }

  @override
  Future<ApiResponse<int>> editPlate(AddPlateParams params) async {
    final result = await remoteDataSource.editPlate(params);
    return result;
  }

  @override
  Future<ApiResponse<AdFeatureDto>> fetchAdFeature() async {
    return await remoteDataSource.fetchAdFeature();
  }

  @override
  Future<ApiResponse> hidePlate(int id) async {
    return await remoteDataSource.hidePlate(id);
  }

  @override
  Future<ApiResponse> soldPlate(int id) async {
    return await remoteDataSource.soldPlate(id);
  }

  @override
  Future<ApiResponse> addSpecialPlate(AdSpecialParams params) async {
    return await remoteDataSource.addSpecialPlate(params);
  }

  @override
  Future<ApiResponse> deletePlate(int id) async {
    return await remoteDataSource.deletePlate(id);
  }

}
