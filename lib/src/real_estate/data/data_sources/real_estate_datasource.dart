import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dalalah/core/network/api_response.dart';
import 'package:dalalah/core/utils/constants.dart';
import '../models/add_real_estate_params.dart';
import '../models/category_details_dto.dart';
import '../models/get_real_estate_params.dart';
import '../models/real_estate_model.dart';
import '../models/real_estate_type_dto.dart';
part 'real_estate_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  RealEstateDatasource{

  @factoryMethod
  factory RealEstateDatasource(Dio dio) = _RealEstateDatasource;

  @GET('/get-prop-categories')
  Future<ApiResponse<List<RealEstateCategoryDto>>> fetchRealEstateCategories();

  @GET('/get-prop-category-assets/{id}')
  Future<ApiResponse<RealEstateCategoryDetailsDto>> fetchRealEstateCategoriesDetails(@Path('id') int id);

  @GET('/get-properties')
  Future<ApiResponse<RealEstatesModel>> fetchRealEstates(
      @Part(name: 'type') String type,
      // @Part(name: 'prop_status') String status,
      );


///Add Real Estate
  @MultiPart()
  @POST('/store-property')
  Future<ApiResponse<int>> addRealEstate(
    @Part(name: 'type') String type,
    @Part(name: 'prop_status') String status,
    @Part(name: 'category_id') int categoryId,
    @Part(name: 'price') dynamic price,
    @Part(name: 'description') String description,
    @Part(name: 'city_id') int cityId,
    @Part(name: 'street_name') String streetName,
    @Part(name: 'lat') String lat,
    @Part(name: 'lng') String lng,
    @Part(name: 'features[]') List<int> features,
    @Part(name: 'cover') File cover,
    @Part(name: 'images[]') List<File> images,
    @Part(name: 'details_ids[]') List<int> ids,
    @Part(name: 'details_vals[]')  List<String> values,
  );


}