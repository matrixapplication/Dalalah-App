
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/car_dto.dart';
import '../models/branch_dto.dart';
import '../models/showroom_cars_params.dart';
import '../models/showroom_dto.dart';

part 'showrooms_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class ShowroomsDatasource {
  @factoryMethod
  factory ShowroomsDatasource(Dio dio) = _ShowroomsDatasource;

  @GET('/get_showrooms')
  Future<ApiResponse<List<ShowroomDto>>> fetchShowrooms(@Query('page') int page);

  @GET('/get_showrooms')
  Future<ApiResponse<ShowroomDto>> fetchShowroomDetails(@Path('id') int id);

  @GET('/showroom/branches')
  Future<ApiResponse<List<BranchDto>>> fetchAllBranches();

  @GET('/branch/{id}')
  Future<ApiResponse<List<BranchDto>>> fetchBranchesById(@Path('id') int id);

  @GET('/showroom_cars/{id}')
  Future<ApiResponse<List<CarDto>>> fetchShowroomCars(@Path('id') id, @Queries() ShowroomCarsParams params);
}
