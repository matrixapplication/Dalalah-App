
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../domain/repositories/base_home_repo.dart';
import '../data_sources/home_datasource.dart';
import '../models/brand_dto.dart';
import '../models/car_dto.dart';
import '../models/car_filter_params.dart';
import '../models/slide_dto.dart';


@Injectable(as: BaseHomeRepo)
class HomeRepo extends BaseHomeRepo{
  final HomeDatasource  datasource;
  HomeRepo(this.datasource);

  @override
  Future<ApiResponse<List<SlideDto>>> fetchSliders() async {
    return  await datasource.fetchSliders();
  }

  @override
  Future<ApiResponse<List<BrandDto>>> fetchBrands() async {
    return await datasource.fetchBrands();
  }

  @override
  Future<ApiResponse<List<CarDto>>> fetchCars(CarFilterParams params) async {
    return await datasource.fetchCars( params);
  }

}