import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:arabitac/core/network/api_response.dart';
import 'package:arabitac/core/utils/constants.dart';

import '../../domain/entities/invoice.dart';

part 'filter_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  FilterDatasource{

  @factoryMethod
  factory FilterDatasource(Dio dio) = _FilterDatasource;

  @GET('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<List<Invoice>>> fetchInvoices();
}