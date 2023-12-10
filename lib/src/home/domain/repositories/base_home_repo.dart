
import '../../../../core/network/api_response.dart';
import '../../data/models/brand_dto.dart';
import '../../data/models/car_dto.dart';
import '../../data/models/car_filter_params.dart';
import '../../data/models/slide_dto.dart';

abstract class BaseHomeRepo {
  Future<ApiResponse<List<SlideDto>>> fetchSliders();
  Future<ApiResponse<List<BrandDto>>> fetchBrands();
  Future<ApiResponse<List<CarDto>>> fetchCars(CarFilterParams params);
}
