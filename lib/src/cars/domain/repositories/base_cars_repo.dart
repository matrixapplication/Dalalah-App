
import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';
import '../../data/models/car_details_dto.dart';

abstract class BaseCarsRepo {
  Future<CarDetailsDto> fetchCarDetails(int id);
  Future<ApiResponse<List<CarDto>>> fetchMyCars(int page);

}
