import 'package:injectable/injectable.dart';

import '../../../home/domain/entities/car.dart';
import '../entities/car_details.dart';
import '../repositories/base_cars_repo.dart';

@Injectable()
class CarsUseCase {
  final BaseCarsRepo repository;

  CarsUseCase(this.repository);

  Future<CarDetails> fetchCarDetails(int id) async {
     final data = await repository.fetchCarDetails(id);
     return  CarDetails.fromDto(data);
  }

  Future<List<Car>> fetchMyCars(int page) async {
    final data = await repository.fetchMyCars(page);
    return data.data?.map((e) => Car.fromDto(e)).toList() ?? [];
  }
}
