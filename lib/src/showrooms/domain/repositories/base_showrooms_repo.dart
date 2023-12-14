
import '../../../../core/network/api_response.dart';
import '../../data/models/branch_dto.dart';
import '../../data/models/showroom_dto.dart';

abstract class BaseShowroomsRepo {
  Future<ApiResponse<List<ShowroomDto>>> fetchShowrooms(int page);
  Future<ApiResponse<List<BranchDto>>> fetchAllBranches();
  Future<ApiResponse<List<BranchDto>>> fetchBranchesById(int id);

}