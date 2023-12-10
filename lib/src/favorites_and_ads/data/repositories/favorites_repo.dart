import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';
import '../../domain/repositories/base_favorites_repo.dart';
import '../data_sources/favorites_datasource.dart';
import '../models/add_to_favorite_params.dart';

@Injectable(as: BaseFavoritesRepo)
class FavoritesRepo extends BaseFavoritesRepo {
  final FavoritesDatasource remoteDataSource;

  FavoritesRepo(this.remoteDataSource);

  @override
  Future<ApiResponse<List<CarDto>>> fetchFavorites() async {
    return await remoteDataSource.fetchFavorites();
  }

  @override
  Future<ApiResponse<bool>> toggleFavorite(int id) async {
    final result = await remoteDataSource.toggleFavorite(AddToFavoriteParams(carId: id));
    return result;
  }
}
