import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../domain/repositories/base_plates_repo.dart';
import '../data_sources/plates_datasource.dart';

@Injectable(as: BasePlatesRepo)
class PlatesRepo extends BasePlatesRepo {
  final PlatesDatasource remoteDataSource;

  PlatesRepo(this.remoteDataSource);

  @override
  Future<ApiResponse<List<String>>> fetchFavorites() async {
    return await remoteDataSource.fetchPlates();
  }

  @override
  Future<ApiResponse<String>> toggleFavorite(String id) async {
    final result = await remoteDataSource.toggleFavorite(id);
    return result;
  }
}
