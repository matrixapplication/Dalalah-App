import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';
import '../../domain/repositories/base_showrooms_repo.dart';
import '../data_sources/showrooms_datasource.dart';
import '../models/add_branch_params.dart';
import '../models/add_rate_params.dart';
import '../models/agency_dto.dart';
import '../models/agency_params.dart';
import '../models/branch_dto.dart';
import '../models/showroom_cars_params.dart';
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

  @override
  Future<ApiResponse<List<CarDto>>> fetchShowroomCars(ShowroomCarsParams params) async {
    return await remoteDataSource.fetchShowroomCars(params.id, params);
  }

  @override
  Future<ApiResponse> addBranch(AddBranchParams params) async {
    return await remoteDataSource.addBranch(params);
  }

  @override
  Future<ApiResponse> editBranch(AddBranchParams params) async {
    return await remoteDataSource.editBranch(params.id, params);
  }

  @override
  Future<ApiResponse> hideBranch(id) async {
    return await remoteDataSource.hideBranch(id);
  }

  @override
  Future<ApiResponse<List<ShowroomDto>>> fetchAgencies(AgencyParams params) async {
    return await remoteDataSource.fetchAgencies(params);
  }

  @override
  Future<ApiResponse> addFollowShowrooms(int id) async {
    return await remoteDataSource.addFollowShowrooms(id);
  }

  @override
  Future<ApiResponse<List<ShowroomDto>>> fetchFollowShowrooms(int page) async {
    return await remoteDataSource.fetchFollowShowrooms(page);
  }

  @override
  Future<ApiResponse> addRateShowroom(AddRateParams params) async {
    return await remoteDataSource.addRateShowroom(params);
  }
}
