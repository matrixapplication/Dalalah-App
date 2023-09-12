
import '../../../../core/network/api_response.dart';
import '../entities/profile.dart';



abstract class BaseProfileRepo<T>{
  Future<Profile> fetchProfileData();
  Future<String> deleteProfileData();
  Future<ApiResponse<String>> editProfileData();
}
