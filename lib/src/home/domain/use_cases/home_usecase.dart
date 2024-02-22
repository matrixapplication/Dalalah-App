import 'package:dalalah/core/network/api_response.dart';
import 'package:dalalah/src/home/data/models/car_dto.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/car_filter_params.dart';
import '../entities/brand.dart';
import '../entities/car.dart';
import '../entities/slide.dart';
import '../repositories/base_home_repo.dart';

@Injectable()
class HomeUseCase {
  final BaseHomeRepo repository ;
  HomeUseCase(this.repository);

  Future<List<Slide>> fetchSliders() async {
    final response = await repository.fetchSliders();
    return response.data!.map((e) => Slide.fromDto(e)).toList();
  }

  Future<List<Brand>> fetchBrands() async {
    final response = await repository.fetchBrands();
    return response.data!.map((e) => Brand.fromDto(e)).toList();
  }

  Future<ApiResponse<List<CarDto>>> fetchCars(CarFilterParams params) async {
    return await repository.fetchCars(params);
    // return response.data!.map((e) => Car.fromDto(e)).toList();
  }
}