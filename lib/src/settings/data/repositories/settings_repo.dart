
import 'package:injectable/injectable.dart';

import '../../domain/repositories/base_settings_repo.dart';
import '../data_sources/settings_datasource.dart';

@Injectable(as: BaseSettingsRepo)
class SettingsRepo extends BaseSettingsRepo{
  final SettingsDatasource  apiProvider;
  SettingsRepo(this.apiProvider);


  @override
  Future<String> fetchAboutLogeste() async{
    final data = await apiProvider.fetchAbout();
    return data.payload!;
  }

}