import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../domain/repositories/base_plates_repo.dart';
import '../data_sources/plates_datasource.dart';
import '../models/add_plate_params.dart';
import '../models/plate_dto.dart';

@Injectable(as: BasePlatesRepo)
class PlatesRepo extends BasePlatesRepo {
  final PlatesDatasource remoteDataSource;

  PlatesRepo(this.remoteDataSource);

  @override
  Future<ApiResponse<List<PlateDto>>> fetchPlates() async {
    return await remoteDataSource.fetchPlates();
  }

  @override
  Future<String> toggleFavoritePlate(int id) async {
    final result = await remoteDataSource.toggleFavoritePlate(id);
    return result.message ?? '';
  }

  @override
  Future<String> addPlate(AddPlateParams params) async {
    final result = await remoteDataSource.addPlate(params);
    return result.message ?? '';
  }
}
