import 'package:dalalah/core/network/api_response.dart';
import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/home/data/models/car_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    HelperMethods.saveSlider(response.data!);

    return response.data!.map((e) => Slide.fromDto(e)).toList();
  }
  Future<List<Slide>> fetchSlidersCash() async{
    final data  = await HelperMethods.getSliders();
    return data!.map((e) =>Slide.fromDto(e)).toList();
  }
  Future<List<Brand>> fetchBrands() async {
    final response = await repository.fetchBrands();
    HelperMethods.saveBrands(response.data!);
    return response.data!.map((e) => Brand.fromDto(e)).toList();
  }

  Future<ApiResponse<List<CarDto>>> fetchCars(CarFilterParams params) async {
    final res = await repository.fetchCars(params);
    HelperMethods.saveCars(res.data!);
    return res;
    // return response.data!.map((e) => Car.fromDto(e)).toList();
  }
}