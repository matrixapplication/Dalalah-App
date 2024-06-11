
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';
import '../../domain/repositories/base_cars_repo.dart';
import '../data_sources/cars_datasource.dart';
import '../models/add_comment_params.dart';
import '../models/add_special_params.dart';
import '../models/car_details_dto.dart';
import '../models/comment_dto.dart';
import '../models/comment_params.dart';
import '../models/update_car_date_params.dart';


@Injectable(as: BaseCarsRepo)
class CarsRepo extends BaseCarsRepo{
  final CarsDatasource  datasource;
  CarsRepo(this.datasource);

  @override
  Future<CarDetailsDto> fetchCarDetails(int id) async {
    final data = await datasource.fetchCarDetails(id);
    return data.data!;
  }

  @override
  Future<ApiResponse<List<CarDto>>> fetchMyCars(int page) async {
    return await datasource.fetchMyCars(page);
  }

  @override
  Future<ApiResponse<List<CommentDto>>> fetchComments(CommentParams params) async {
    return await datasource.fetchComments(params);
  }

  @override
  Future<ApiResponse> addComment(AddCommentParams params) async {
    return await datasource.addComment(params);
  }

  @override
  Future<ApiResponse> reportComment(int id) async {
    return await datasource.reportComment(id);
  }

  @override
  Future<ApiResponse> deleteComment(int id) async {
    return await datasource.deleteComment(id);
  }

  @override
  Future<ApiResponse> hideCar(int id) async {
    return await datasource.hideCar(id);
  }

  @override
  Future<ApiResponse> soldCar(int id) async {
    return await datasource.soldCar(id);
  }

  @override
  Future<ApiResponse> addSpecialCar(AdSpecialParams params) async {
    return await datasource.addSpecialCar(params);
  }

  @override
  Future<ApiResponse> deleteCar(int id) async {
    return await datasource.deleteCar(id);
  }

  @override
  Future<ApiResponse> updateCarDate(UpdateCarDateParams params) async {
    return await datasource.updateCarDate(params);
  }
}