
import '../../../../core/network/api_response.dart';
import '../../data/models/about_us_dto.dart';

abstract class BaseSettingsRepo {
  Future<ApiResponse<AboutUsDto>> fetchAboutUs();
  Future<ApiResponse<AboutUsDto>> fetchBuyingAndSellingAbout();
  Future<ApiResponse<AboutUsDto>> fetchTermsAndConditions();
  Future<ApiResponse<AboutUsDto>> fetchPrivacy();
}
