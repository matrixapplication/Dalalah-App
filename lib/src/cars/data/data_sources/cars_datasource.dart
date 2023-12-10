import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/car_dto.dart';
import '../models/car_details_dto.dart';

part 'cars_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  CarsDatasource{

  @factoryMethod
  factory CarsDatasource(Dio dio) = _CarsDatasource;

  @GET('/show_car/{id}')
  Future<ApiResponse<CarDetailsDto>> fetchCarDetails(@Path('id') int id);

  @GET('/my-cars')
  Future<ApiResponse<List<CarDto>>> fetchMyCars(@Query('page') int page);

}