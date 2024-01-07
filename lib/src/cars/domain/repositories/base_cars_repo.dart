
import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';
import '../../data/models/add_comment_params.dart';
import '../../data/models/add_special_params.dart';
import '../../data/models/car_details_dto.dart';
import '../../data/models/comment_dto.dart';
import '../../data/models/comment_params.dart';

abstract class BaseCarsRepo {
  Future<CarDetailsDto> fetchCarDetails(int id);
  Future<ApiResponse<List<CarDto>>> fetchMyCars(int page);
  Future<ApiResponse<List<CommentDto>>> fetchComments(CommentParams params);
  Future<ApiResponse> addComment(AddCommentParams params);
  Future<ApiResponse> reportComment(int id);
  Future<ApiResponse> deleteComment(int id);
  Future<ApiResponse> hideCar(int id);
  Future<ApiResponse> soldCar(int id);
  Future<ApiResponse> addSpecialCar(AdSpecialParams params);
}
