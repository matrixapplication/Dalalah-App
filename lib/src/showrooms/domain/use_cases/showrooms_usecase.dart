import 'package:dalalah/core/network/api_response.dart';
import 'package:dalalah/src/plates/data/models/plate_dto.dart';
import 'package:dalalah/src/showrooms/data/models/showroom_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../home/data/models/car_dto.dart';
import '../../data/models/add_branch_params.dart';
import '../../data/models/add_rate_params.dart';
import '../../data/models/agency_params.dart';
import '../../data/models/showroom_cars_params.dart';
import '../../data/models/showroom_plates_params.dart';
import '../entities/branch.dart';
import '../entities/showroom.dart';
import '../repositories/base_showrooms_repo.dart';

@Injectable()
class ShowroomsUseCase {
  final BaseShowroomsRepo repository;

  ShowroomsUseCase(this.repository);

  Future<ApiResponse<List<ShowroomDto>>> fetchShowrooms(int page) async {
    return await repository.fetchShowrooms(page);
  }

  Future<Showroom> fetchShowroomDetails(int id) async {
    final data = await repository.fetchShowroomDetails(id);
    return Showroom.fromDto(data.data!);
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

  Future<String> addBranch(AddBranchParams params) async {
    final data =  await repository.addBranch(params);
    return data.message ?? '';
  }

  Future<String> editBranch(AddBranchParams params) async {
    final data = await repository.editBranch(params);
    return data.message ?? '';
  }

  Future<ApiResponse> hideBranch(id) async {
    return await repository.hideBranch(id);
  }

  Future<ApiResponse<List<ShowroomDto>>> fetchAgencies(AgencyParams params) async {
    return await repository.fetchAgencies(params);
  }

  Future<String> addFollowShowrooms(int id) async {
    final data = await repository.addFollowShowrooms(id);
    return data.message ?? '';
  }



  Future<String> addRateShowroom(AddRateParams params) async {
    final data = await repository.addRateShowroom(params);
    return data.message ?? '';
  }
  Future<ApiResponse<List<ShowroomDto>>> fetchFollowShowrooms(int page) async {
    return await repository.fetchFollowShowrooms(page);
  }

  Future<ApiResponse<List<PlateDto>>> fetchShowroomPlates(ShowroomPlatesParams params) async {
    return await repository.fetchShowroomPlates(params);
  }
}