import 'package:injectable/injectable.dart';

import '../../../home/domain/entities/car.dart';
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

  Future<List<Car>> fetchMyCars(int page) async {
    final data = (await repository.fetchMyCars(page));
    return data.data!.map((e) => Car.fromDto(e)).toList();
  }

  Future<bool> toggleFavoriteCar(AddToFavoriteParams params) async {
    final data = (await repository.toggleFavoriteCar(params));
    return data.data!;
  }

  // Plates APIs
  Future<List<Car>> fetchMyPlates(int page) async {
    final data = (await repository.fetchMyPlates(page));
    return data.data!.map((e) => Car.fromDto(e)).toList();
  }

  Future<bool> toggleFavoritePlate(AddToFavoriteParams params) async {
    final data = (await repository.toggleFavoritePlate(params));
    return data.data!;
  }

  Future<List<Car>> fetchFavoritePlates(int page) async {
    final data = (await repository.fetchFavoritePlates(page));
    return data.data!.map((e) => Car.fromDto(e)).toList();
  }
}
