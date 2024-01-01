
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/car_dto.dart';
import '../models/add_branch_params.dart';
import '../models/add_rate_params.dart';
import '../models/agency_params.dart';
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

  @POST('/add_branch')
  Future<ApiResponse> addBranch(@Body() AddBranchParams params);

  @POST('/edit_branch/{id}')
  Future<ApiResponse> editBranch(@Path('id') id, @Body() AddBranchParams params);

  @POST('/showroom_cars/{id}')
  Future<ApiResponse> hideBranch(@Path('id') id);

  @GET('/get_agencies')
  Future<ApiResponse<List<ShowroomDto>>> fetchAgencies(@Queries() AgencyParams params);

  @POST('/follow_showroom/{id}')
  Future<ApiResponse> addFollowShowrooms(@Path('id') id);

  @GET('/followed_showroom')
  Future<ApiResponse<List<ShowroomDto>>> fetchFollowShowrooms(@Query('page') int page);

  @POST('/add_rate')
  Future<ApiResponse> addRateShowroom(@Body() AddRateParams params);
}
