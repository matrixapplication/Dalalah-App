import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dalalah/core/network/api_response.dart';
import 'package:dalalah/core/utils/constants.dart';
import '../../../cars/data/models/add_special_params.dart';
import '../models/add_real_estate_params.dart';
import '../models/category_details_dto.dart';
import '../models/get_real_estate_params.dart';
import '../models/my_properties_response.dart';
import '../models/properties_developer_details.dart';
import '../models/properties_developers.dart';
import '../models/real_estate_model.dart';
import '../models/real_estate_params.dart';
import '../models/real_estate_type_dto.dart';
import '../models/update_real_estate_params.dart';
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
  Future<ApiResponse<RealEstatesModel>> fetchRealEstates(@Queries() RealEstateParams params,);


///Add Real Estate
  @MultiPart()
  @POST('/store-property')
  Future<ApiResponse> addRealEstate(
    @Part(name: 'type') String type,
    @Part(name: 'prop_status') String status,
    @Part(name: 'category_id') int categoryId,
    @Part(name: 'price') dynamic price,
    @Part(name: 'description') String description,
    @Part(name: 'city_id') int cityId,
    @Part(name: 'street_name') String streetName,
    @Part(name: 'lat') String lat,
    @Part(name: 'lng') String lng,
    @Part(name: 'features[]') List<String> features,
    @Part(name: 'cover') File cover,
    @Part(name: 'images[]') List<File> images,
    @Part(name: 'details_ids[]') List<String> ids,
    @Part(name: 'details_vals[]')  List<String> values,
  );

  @MultiPart()
  @POST('/update-property/{id}')
  Future<ApiResponse> editRealEstate(
      @Path() int id,
      @Part(name: 'type') String type,
      @Part(name: 'prop_status') String status,
      @Part(name: 'category_id') int categoryId,
      @Part(name: 'price') dynamic price,
      @Part(name: 'description') String description,
      @Part(name: 'city_id') int cityId,
      @Part(name: 'street_name') String streetName,
      @Part(name: 'lat') String lat,
      @Part(name: 'lng') String lng,
      @Part(name: 'features[]') List<String> features,
      // @Part(name: 'cover') File cover,
      // @Part(name: 'images[]') List<File> images,
      @Part(name: 'details_ids[]') List<String> ids,
      @Part(name: 'details_vals[]')  List<String> values,
      );


  @POST('/change-property-hide-status/{id}')
  Future<ApiResponse> hideProperty(@Path('id') int id);

  @POST('/is_sold/{id}')
  Future<ApiResponse> soldProperty(@Path('id') int id);

  @POST('/add_car_feature')
  Future<ApiResponse> addSpecialProperty(@Queries() AdSpecialParams params);

  @POST('/delete-property/{id}')
  Future<ApiResponse> deleteProperty(@Path('id') int id);


  @POST('/update-property/{id}')
  Future<ApiResponse> updatePropertyDate(@Body() UpdateRealEstateParams params,@Path('id') int id);


  @GET('/get-property-developers')
  Future<ApiResponse<List<PropertiesDevelopers>>> getPropertiesDevelopers(@Query('page') int page);

  @POST('/edit_car_images')
  Future<ApiResponse> editPropertyImage(
      @Part(name: 'car_id') int? carId,
      @Part(name: 'image') File image,
      @Part(name: 'image_id') int? imageId,
      );

  @POST('/add-property-images/{id}')
  Future<ApiResponse> addPropertyImage(
      @Part(name: 'images[]') List<File> images,
      @Path() int id,
      );

  @POST('/delete-property-image/{id}')
  Future<ApiResponse> deletePropertyImage(@Path('id') int id);

 @GET('/property-details/{id}')
  Future<ApiResponse<Property>> fetchPropertyDetails(@Path('id') int id);
 @GET('/get-property-developer-profile/{id}')
  Future<ApiResponse<PropertiesDeveloperDetails>> fetchPropertiesDevelopersDetails(@Path('id') int id);

}