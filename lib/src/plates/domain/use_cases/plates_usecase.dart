
import 'package:injectable/injectable.dart';

import '../../data/models/add_plate_params.dart';
import '../entities/plate.dart';
import '../repositories/base_plates_repo.dart';

@Injectable()
class PlatesUseCase {
  final BasePlatesRepo repository;

  PlatesUseCase(this.repository);

  Future<List<Plate>> fetchPlates() async {
   // final data = (await repository.fetchFavorites());
    return [
      Plate(
        id: '1',
        name: ' ب ط ل 8888',
        image: 'https://i0.wp.com/almrj3.com/wp-content/uploads/2022/01/6.jpg?resize=520%2C288&ssl=1',
        price: '800,000',
      ),
      Plate(
        id: '1',
        name: ' ب ط ل 8888',
        image: 'https://i0.wp.com/almrj3.com/wp-content/uploads/2022/01/6.jpg?resize=520%2C288&ssl=1',
        price: '800,000',
      ),
      Plate(
        id: '1',
        name: ' ب ط ل 8888',
        image: 'https://i0.wp.com/almrj3.com/wp-content/uploads/2022/01/6.jpg?resize=520%2C288&ssl=1',
        price: '800,000',
      ),
    ];
  }

  Future<String> toggleFavoritePlate(int id) async {
    return await repository.toggleFavoritePlate(id);
  }

  Future<String> addPlate(AddPlateParams params) async {
    return await repository.addPlate(params);
  }
}