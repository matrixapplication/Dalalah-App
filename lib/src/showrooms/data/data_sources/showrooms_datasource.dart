
import 'package:dalalah/src/plates/data/models/plate_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../models/branch_dto.dart';
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

  @POST('/showroom/branches')
  Future<ApiResponse<List<BranchDto>>> fetchAllBranches();

  @POST('/branch/{id}')
  Future<ApiResponse<List<BranchDto>>> fetchBranchesById(@Path('id') int id);
}
