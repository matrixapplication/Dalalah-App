import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';
import '../../../plates/data/models/plate_dto.dart';
import '../../domain/repositories/base_favorites_repo.dart';
import '../data_sources/favorites_datasource.dart';
import '../models/add_to_favorite_params.dart';
import '../../../real_estate/data/models/my_properties_response.dart';

@Injectable(as: BaseFavoritesRepo)
class FavoritesRepo extends BaseFavoritesRepo {
  final FavoritesDatasource remoteDataSource;

  FavoritesRepo(this.remoteDataSource);

  @override
  Future<ApiResponse<List<CarDto>>> fetchFavoriteCars(int page) async {
    return await remoteDataSource.fetchFavoriteCars(page);
  }

  @override
  Future<ApiResponse<List<PlateDto>>> fetchFavoritePlates(int page) async {
    return await remoteDataSource.fetchFavoritePlates(page);
  }

  @override
  Future<ApiResponse<List<CarDto>>> fetchMyCars(int page) async {
    return await remoteDataSource.fetchMyCars(page);
  }

  @override
  Future<ApiResponse<List<PlateDto>>> fetchMyPlates(int page) async {
    return await remoteDataSource.fetchMyPlates(page);
  }
  @override
  Future<ApiResponse<List<Property>>> fetchMyRealEstate(int page) async {
    return await remoteDataSource.fetchMyRealEstate(page);
  }

  @override
  Future<ApiResponse<bool>> toggleFavoriteCarOrPlate(
      AddToFavoriteParams params) async {
    return await remoteDataSource.toggleFavoriteCarOrPlate(params);
  }

}
