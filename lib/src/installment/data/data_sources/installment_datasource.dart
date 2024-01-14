import 'dart:io';

import 'package:dalalah/src/auth/data/models/register_params.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dalalah/core/network/api_response.dart';

import '../../../../core/utils/constants.dart';
import '../../../home/data/models/car_dto.dart';
import '../models/installment_calculation_params.dart';
import '../models/installment_cars_params.dart';
import '../models/profile_dto.dart';


part 'installment_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  InstallmentDataSource{

  @factoryMethod
  factory InstallmentDataSource(Dio dio) = _InstallmentDataSource;

  @POST('/installment_calculation')
  Future<ApiResponse<int>> fetchInstallmentValue(@Body() InstallmentCalculationParams params);

  @GET('/installment_filter')
  Future<ApiResponse<List<CarDto>>> filterCarsByInstallment(@Queries() InstallmentCarsParams params);
}