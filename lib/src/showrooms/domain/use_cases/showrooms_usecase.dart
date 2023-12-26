import 'package:dalalah/core/network/api_response.dart';
import 'package:dalalah/src/showrooms/data/models/showroom_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../home/data/models/car_dto.dart';
import '../../data/models/add_branch_params.dart';
import '../../data/models/agency_dto.dart';
import '../../data/models/agency_params.dart';
import '../../data/models/showroom_cars_params.dart';
import '../entities/branch.dart';
import '../repositories/base_showrooms_repo.dart';

@Injectable()
class ShowroomsUseCase {
  final BaseShowroomsRepo repository;

  ShowroomsUseCase(this.repository);

  Future<ApiResponse<List<ShowroomDto>>> fetchShowrooms(int page) async {
    return await repository.fetchShowrooms(page);
  }

  Future<List<Branch>> fetchAllBranches() async {
    final data = await repository.fetchAllBranches();
    return data.data?.map((e) => Branch.fromDto(e)).toList() ?? [];
  }

  Future<List<Branch>> fetchBranchesById(int id) async {
    final data = await repository.fetchBranchesById(id);
    return data.data?.map((e) => Branch.fromDto(e)).toList() ?? [];
  }

  Future<ApiResponse<List<CarDto>>> fetchShowroomCars(ShowroomCarsParams params) async {
    return (await repository.fetchShowroomCars(params));
  }

  Future<ApiResponse> addBranch(AddBranchParams params) async {
    final data =  await repository.addBranch(params);
    return data;
  }

  Future<ApiResponse> editBranch(AddBranchParams params) async {
    final data = await repository.editBranch(params);
    return data;
  }

  Future<ApiResponse> hideBranch(id) async {
    return await repository.hideBranch(id);
  }

  Future<ApiResponse<List<ShowroomDto>>> fetchAgencies(AgencyParams params) async {
    return await repository.fetchAgencies(params);
  }
}