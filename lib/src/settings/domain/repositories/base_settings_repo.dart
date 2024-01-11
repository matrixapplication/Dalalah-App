
import '../../../../core/network/api_response.dart';
import '../../data/models/about_us_dto.dart';
import '../../data/models/contact_us_dto.dart';
import '../entities/add_support_params.dart';

abstract class BaseSettingsRepo {
  Future<ApiResponse<AboutUsDto>> fetchAboutUs();
  Future<ApiResponse<AboutUsDto>> fetchBuyingAndSellingAbout();
  Future<ApiResponse<AboutUsDto>> fetchTermsAndConditions();
  Future<ApiResponse<AboutUsDto>> fetchPrivacy();
  Future<ContactUsDto> fetchContactUs();
  Future<String> addSupport( AddSupportParams params);
}
