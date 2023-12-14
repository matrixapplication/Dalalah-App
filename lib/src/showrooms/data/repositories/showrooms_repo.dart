import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../domain/repositories/base_showrooms_repo.dart';
import '../data_sources/showrooms_datasource.dart';
import '../models/branch_dto.dart';
import '../models/showroom_dto.dart';

@Injectable(as: BaseShowroomsRepo)
class ShowroomsRepo extends BaseShowroomsRepo {
  final ShowroomsDatasource remoteDataSource;

  ShowroomsRepo(this.remoteDataSource);

  @override
  Future<ApiResponse<List<ShowroomDto>>> fetchShowrooms(int page) async {
    return await remoteDataSource.fetchShowrooms( page);
  }

  @override
  Future<ApiResponse<List<BranchDto>>> fetchAllBranches()async {
    return await remoteDataSource.fetchAllBranches();
  }

  @override
  Future<ApiResponse<List<BranchDto>>> fetchBranchesById(int id) async {
    return await remoteDataSource.fetchBranchesById(id);
  }
}
