import 'package:injectable/injectable.dart';

import '../repositories/base_settings_repo.dart';

@Injectable()
class SettingsUseCase {
 BaseSettingsRepo repository ;
  SettingsUseCase(this.repository);

  Future<String> fetchAbout() async{
  //  return repository.fetchAboutLogeste();
    return 'Logeste is a mobile application that allows you to send money to your friends and family in Egypt and abroad, and you can also receive money from them.';
  }

}