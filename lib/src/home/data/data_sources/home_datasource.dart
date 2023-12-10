import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../models/brand_dto.dart';
import '../models/car_dto.dart';
import '../models/car_filter_params.dart';
import '../models/slide_dto.dart';

part 'home_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  HomeDatasource{

  @factoryMethod
  factory HomeDatasource(Dio dio) = _HomeDatasource;

  @GET('/sliders')
  Future<ApiResponse<List<SlideDto>>> fetchSliders();

  @GET('/brands')
  Future<ApiResponse<List<BrandDto>>> fetchBrands();

  @GET('/get_cars')
  Future<ApiResponse<List<CarDto>>> fetchCars(@Queries() CarFilterParams params);

}