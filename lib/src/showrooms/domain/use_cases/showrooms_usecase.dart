import 'package:dalalah/core/network/api_response.dart';
import 'package:dalalah/src/showrooms/data/models/showroom_dto.dart';
import 'package:injectable/injectable.dart';

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
    final data = await repository.fetchAllBranches();
    return data.data?.map((e) => Branch.fromDto(e)).toList() ?? [];
  }
}