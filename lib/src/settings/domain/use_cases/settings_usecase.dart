import 'package:injectable/injectable.dart';

import '../entities/about_us.dart';
import '../repositories/base_settings_repo.dart';

@Injectable()
class SettingsUseCase {
 BaseSettingsRepo repository ;
  SettingsUseCase(this.repository);

  Future<AboutUs> fetchAboutUs() async{
    final data = await repository.fetchAboutUs();
    return AboutUs.fromJson(data.data!);
  }

  Future<AboutUs> fetchBuyingAndSellingAbout() async{
    final data = await repository.fetchBuyingAndSellingAbout();
    return AboutUs.fromJson(data.data!);
  }

  Future<AboutUs> fetchTermsAndConditions() async{
    final data = await repository.fetchTermsAndConditions();
    return AboutUs.fromJson(data.data!);
  }

  Future<AboutUs> fetchPrivacy() async{
    final data = await repository.fetchPrivacy();
    return AboutUs.fromJson(data.data!);
  }

}