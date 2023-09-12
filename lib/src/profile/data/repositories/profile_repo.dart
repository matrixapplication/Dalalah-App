
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/base_profile_repo.dart';
import '../data_sources/profile_datasource.dart';


@Injectable(as: BaseProfileRepo)
class ProfileRepo extends BaseProfileRepo{
  final ProfileDataSource  apiProvider;
  ProfileRepo(this.apiProvider);

  @override
  Future<Profile> fetchProfileData() async{
    final response = await apiProvider.fetchProfileData();
    return response.payload!;
  }

  @override
  Future<String> deleteProfileData() async{
    final response = await apiProvider.deleteProfileData();
    return response.payload!;
  }

  @override
  Future<ApiResponse<String>> editProfileData() async{
    return await apiProvider.deleteProfileData();
  }


}