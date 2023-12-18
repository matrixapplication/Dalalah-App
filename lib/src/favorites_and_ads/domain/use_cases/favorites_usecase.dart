import 'package:dalalah/core/network/api_response.dart';
import 'package:dalalah/src/home/data/models/car_dto.dart';
import 'package:dalalah/src/plates/data/models/plate_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../home/domain/entities/car.dart';
import '../../../plates/domain/entities/plate.dart';
import '../../data/models/add_to_favorite_params.dart';
import '../repositories/base_favorites_repo.dart';

@Injectable()
class FavoritesUseCase {
  final BaseFavoritesRepo repository;

  FavoritesUseCase(this.repository);

  // Cars APIs
  Future<List<Car>> fetchFavoriteCars(int page) async {
    final data = (await repository.fetchFavoriteCars(page));
    return data.data!.map((e) => Car.fromDto(e)).toList();
  }

  Future<ApiResponse<List<CarDto>>> fetchMyCars(int page) async {
    return (await repository.fetchMyCars(page));
   // return data.data!.map((e) => Car.fromDto(e)).toList();
  }

  Future<String> toggleFavoriteCarOrPlate(AddToFavoriteParams params) async {
    final data = (await repository.toggleFavoriteCarOrPlate(params));
    return data.message ?? '';
  }

  // Plates APIs
  Future<ApiResponse<List<PlateDto>>> fetchMyPlates(int page) async {
    return (await repository.fetchMyPlates(page));
  //  return data.data!.map((e) => Plate.fromDto(e)).toList();
  }

  Future<List<Plate>> fetchFavoritePlates(int page) async {
    final data = (await repository.fetchFavoritePlates(page));
    return data.data!.map((e) => Plate.fromDto(e)).toList();
  }
}
