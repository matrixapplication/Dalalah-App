
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';
import '../../domain/repositories/base_cars_repo.dart';
import '../data_sources/cars_datasource.dart';
import '../models/car_details_dto.dart';


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
    final data = await datasource.fetchMyCars(page);
    return data;
  }
}