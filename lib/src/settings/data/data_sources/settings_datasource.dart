import 'package:arabitac/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_response.dart';
import '../models/about_us_dto.dart';

part 'settings_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  SettingsDatasource{

  @factoryMethod
  factory SettingsDatasource(Dio dio) = _SettingsDatasource;

  @GET('/about-us')
  Future<ApiResponse<AboutUsDto>> fetchAboutUs();

  @GET('/buying-and-selling-privacy')
  Future<ApiResponse<AboutUsDto>> fetchBuyingAndSellingAbout();

  @GET('/terms-and-conditions')
  Future<ApiResponse<AboutUsDto>> fetchTermsAndConditions();

  @GET('/privacy')
  Future<ApiResponse<AboutUsDto>> fetchPrivacy();
}