
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../domain/repositories/base_settings_repo.dart';
import '../data_sources/settings_datasource.dart';
import '../models/about_us_dto.dart';

@Injectable(as: BaseSettingsRepo)
class SettingsRepo extends BaseSettingsRepo{
  final SettingsDatasource  apiProvider;
  SettingsRepo(this.apiProvider);


  @override
  Future<ApiResponse<AboutUsDto>> fetchAboutUs() async{
    final data = await apiProvider.fetchAboutUs();
    return data;
  }

  @override
  Future<ApiResponse<AboutUsDto>> fetchBuyingAndSellingAbout() async{
    final data = await apiProvider.fetchBuyingAndSellingAbout();
    return data;
  }

  @override
  Future<ApiResponse<AboutUsDto>> fetchTermsAndConditions() async{
    final data = await apiProvider.fetchTermsAndConditions();
    return data;
  }

  @override
  Future<ApiResponse<AboutUsDto>> fetchPrivacy() async{
    final data = await apiProvider.fetchPrivacy();
    return data;
  }

}