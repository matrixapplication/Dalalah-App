import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:delala/core/network/api_response.dart';

import '../../domain/entities/material_packaging.dart';
import '../../domain/entities/returner.dart';
import '../../domain/entities/tasks.dart';
import '../models/material_packaging_dto.dart';
import '../models/pick_up_params.dart';
import '../models/returner_dto.dart';

part 'cars_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: 'kBASE_URL')
abstract class  CarsDatasource{

  @factoryMethod
  factory CarsDatasource(Dio dio) = _CarsDatasource;

  @GET('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<List<Task>>> fetchTasks();

  @POST('/api/v1/Operations/CollectionWithoutBarcode')
  Future<ApiResponse<String>> collectionWithoutBarcode(@Body() PickUpParams params);

  @POST('/api/v1/Operations/CollectByBarcode')
  Future<ApiResponse<String>> collectByBarcode(@Body() PickUpParams params);

  @POST('/api/v1/Operations/DeliveryCollection')
  Future<ApiResponse<String>> deliveryCollection();

  @POST('/api/v1/Operations/RejectCollection')
  Future<ApiResponse<String>> rejectCollection();

  @POST('/api/v1/Operations/ConfirmCollectionProcess')
  Future<ApiResponse<String>> confirmCollectionProcess(@Body() String number);

  @GET('/api/v1/Operations/GetReturnerShipments')
  Future<ApiResponse<List<ReturnerDto>>> fetchReturnerShipments();

  @POST('/api/v1/Operations/DeliveryReturner')
  Future<ApiResponse<String>> deliveryReturner(@Body() List<Returner> returners);

  @POST('/api/v1/Operations/RejectReturner')
  Future<ApiResponse<String>> rejectReturner(@Body() List<Returner> returners);

  @GET('/api/v1/Operations/GetMaterialPackaging')
  Future<ApiResponse<List<MaterialPackagingDto>>> fetchMaterialPackaging();

  @POST('/api/v1/Operations/DeliveryMaterial')
  Future<ApiResponse<String>> deliveryMaterial(@Body() List<MaterialPackaging> params);

  @POST('/api/v1/Operations/RejectMaterial')
  Future<ApiResponse<String>> rejectMaterial(@Body() List<MaterialPackaging> params);

}