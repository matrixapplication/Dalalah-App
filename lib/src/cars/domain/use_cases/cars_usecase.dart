import 'package:dalalah/core/network/api_response.dart';
import 'package:dalalah/src/cars/data/models/comment_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../home/domain/entities/car.dart';
import '../../data/models/add_comment_params.dart';
import '../../data/models/add_special_params.dart';
import '../../data/models/comment_params.dart';
import '../entities/car_details.dart';
import '../repositories/base_cars_repo.dart';

@Injectable()
class CarsUseCase {
  final BaseCarsRepo repository;

  CarsUseCase(this.repository);

  Future<CarDetails> fetchCarDetails(int id) async {
     final data = await repository.fetchCarDetails(id);
     return  CarDetails.fromDto(data);
  }

  Future<List<Car>> fetchMyCars(int page) async {
    final data = await repository.fetchMyCars(page);
    return data.data?.map((e) => Car.fromDto(e)).toList() ?? [];
  }

  Future<ApiResponse<List<CommentDto>>> fetchComments(CommentParams params) async {
    return await repository.fetchComments(params);
  }

  Future<String> addComment(AddCommentParams params) async {
    final data = await repository.addComment(params);
    return data.message ?? '';
  }

  Future<String> reportComment(int id) async {
    final data = await repository.reportComment(id);
    return data.message ?? '';
  }

  Future<String> deleteComment(int id) async {
    final data = await repository.deleteComment(id);
    return data.message ?? '';
  }

  Future<String> hideCar(int id) async {
    final data = await repository.hideCar(id);
    return data.message ?? '';
  }

  Future<String> soldCar(int id) async {
    final data = await repository.soldCar(id);
    return data.message ?? '';
  }

  Future<String> addSpecialCar(AdSpecialParams params) async {
    final data = await repository.addSpecialCar(params);
    return data.message ?? '';
  }
}
