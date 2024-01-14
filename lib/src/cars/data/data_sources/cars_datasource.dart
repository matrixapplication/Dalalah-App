import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/car_dto.dart';
import '../models/add_comment_params.dart';
import '../models/add_special_params.dart';
import '../models/car_details_dto.dart';
import '../models/comment_dto.dart';
import '../models/comment_params.dart';

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

  @GET('/get-review')
  Future<ApiResponse<List<CommentDto>>> fetchComments(@Queries() CommentParams params);

  @POST('/add-review')
  Future<ApiResponse> addComment(@Body() AddCommentParams params);

  @POST('/report-review/{id}')
  Future<ApiResponse> reportComment(@Path('id') int id);

  @DELETE('/delete_review/{id}')
  Future<ApiResponse> deleteComment(@Path('id') int id);

  @POST('/hide_car/{id}')
  Future<ApiResponse> hideCar(@Path('id') int id);

  @POST('/is_sold/{id}')
  Future<ApiResponse> soldCar(@Path('id') int id);

  @POST('/add_car_feature')
  Future<ApiResponse> addSpecialCar(@Queries() AdSpecialParams params);

}