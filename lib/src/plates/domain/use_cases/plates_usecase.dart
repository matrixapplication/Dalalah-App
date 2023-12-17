
import 'package:injectable/injectable.dart';

import '../../data/models/add_plate_params.dart';
import '../entities/plate.dart';
import '../repositories/base_plates_repo.dart';

@Injectable()
class PlatesUseCase {
  final BasePlatesRepo repository;

  PlatesUseCase(this.repository);

  Future<List<Plate>> fetchPlates() async {
   final data = await repository.fetchPlates();
   print('data.data!.length${data.data!.length}');
    return data.data!.map((e) => Plate.fromDto(e)).toList();
  }

  Future<String> toggleFavoritePlate(int id) async {
    return await repository.toggleFavoritePlate(id);
  }

  Future<String> addPlate(AddPlateParams params) async {
    return await repository.addPlate(params);
  }
}