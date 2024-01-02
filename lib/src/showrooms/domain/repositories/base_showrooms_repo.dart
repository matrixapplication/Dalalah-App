
import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';
import '../../data/models/add_branch_params.dart';
import '../../data/models/add_rate_params.dart';
import '../../data/models/agency_params.dart';
import '../../data/models/branch_dto.dart';
import '../../data/models/showroom_cars_params.dart';
import '../../data/models/showroom_dto.dart';

abstract class BaseShowroomsRepo {
  Future<ApiResponse<List<ShowroomDto>>> fetchShowrooms(int page);
  Future<ApiResponse<ShowroomDto>> fetchShowroomDetails(int id);
  Future<ApiResponse<List<BranchDto>>> fetchAllBranches();
  Future<ApiResponse<List<BranchDto>>> fetchBranchesById(int id);
  Future<ApiResponse<List<CarDto>>> fetchShowroomCars(ShowroomCarsParams params);
  Future<ApiResponse> addBranch(AddBranchParams params);
  Future<ApiResponse> editBranch(AddBranchParams params);
  Future<ApiResponse> hideBranch(id);
  Future<ApiResponse<List<ShowroomDto>>> fetchAgencies(AgencyParams params);
  Future<ApiResponse> addFollowShowrooms(int id);
  Future<ApiResponse<List<ShowroomDto>>> fetchFollowShowrooms(int page);
  Future<ApiResponse> addRateShowroom(AddRateParams params);

}