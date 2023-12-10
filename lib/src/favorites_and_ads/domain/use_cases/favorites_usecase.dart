
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../home/domain/entities/car.dart';
import '../repositories/base_favorites_repo.dart';

@Injectable()
class FavoritesUseCase {
  final BaseFavoritesRepo repository;

  FavoritesUseCase(this.repository);

  Future<List<Car>> fetchFavorites() async {
    final data = (await repository.fetchFavorites());
    return data.data!.map((e) => Car.fromDto(e)).toList();
  }

  Future<String> toggleFavorite(int id) async {
    final data = await repository.toggleFavorite(id);
    return data.message!;
  }
}