import 'package:arabitac/core/network/api_response.dart';
import 'package:injectable/injectable.dart';

import '../entities/profile.dart';
import '../repositories/base_profile_repo.dart';



@Injectable()
class ProfileUseCase {
  final BaseProfileRepo repository ;
  ProfileUseCase(this.repository);

  Future<Profile> fetchProfileData() async{
   // return repository.fetchProfileData();
    return Profile(
      name: 'Harbey',
      phone: '00201551205266',
      email: 'mail@saeed.engineer',
      image: 'https://avatars.githubusercontent.com/u/18093086?v=4',
      rating: 4.5,
      companyName: 'شركة / وكيل',
    );
  }

  Future<String> deleteProfileData() {
    return repository.deleteProfileData();
  }

  Future<ApiResponse<String>> editProfileData() {
    return repository.editProfileData();
  }


}