import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dalalah/core/network/api_response.dart';
import 'package:dalalah/core/utils/constants.dart';
import '../models/category_details_dto.dart';
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
}