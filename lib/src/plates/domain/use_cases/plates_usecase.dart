import 'package:dalalah/core/network/api_response.dart';
import 'package:dalalah/src/plates/data/models/plate_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../../cars/data/models/add_special_params.dart';
import '../../../profile/data/models/profile_dto.dart';
import '../../data/models/add_plate_params.dart';
import '../../data/models/plate_filter_params.dart';
import '../../data/models/update_plate_date_params.dart';
import '../entities/ad_feature.dart';
import '../entities/ad_types.dart';
import '../entities/plate.dart';
import '../repositories/base_plates_repo.dart';

@Injectable()
class PlatesUseCase {
  final BasePlatesRepo repository;

  PlatesUseCase(this.repository);

  Future<ApiResponse<List<PlateDto>>> fetchPlates(
      PlateFilterParams params) async {
    final res =await repository.fetchPlates(params);
    HelperMethods.savePlates(res.data!);
    return res;
  }

  Future<Plate> fetchPlateDetails(int id) async {
    final data = await repository.fetchPlateDetails(id);
    return Plate.fromDto(data.data!);
  }

  Future<String> toggleFavoritePlate(int id) async {
    return await repository.toggleFavoritePlate(id);
  }

  Future<dynamic> addPlate(AddPlateParams params) async {
    final data = await repository.addPlate(params);
    return params.adType == AdTypes.featured ? data.data! : data.message;
  }

  Future<dynamic> editPlate(AddPlateParams params) async {
    final data = await repository.editPlate(params);
    return params.adType == AdTypes.featured ? data.data! : data.message;
  }

  Future<AdFeature> fetchAdFeature() async {
    final data = await repository.fetchAdFeature();
    return AdFeature.fromDto(data.data!);
  }

  Future<String> hidePlate(int id) async {
    final data = await repository.hidePlate(id);
    return data.message ?? '';
  }

  Future<String> soldPlate(int id) async {
    final data = await repository.soldPlate(id);
    return data.message ?? '';
  }

  Future<String> addSpecialPlate(AdSpecialParams params) async {
    final data = await repository.addSpecialPlate(params);
    return data.message ?? '';
  }

  Future<String> deletePlate(int id) async {
    final data = await repository.deletePlate(id);
    return data.message ?? '';
  }

  Future<String> updatePlateDate(int id) async {
    ProfileDto? profile = await HelperMethods.getProfile();
    final data = await repository.updatePlateDate(
      UpdatePlateDateParams(
        modelId: profile?.id ?? 0,
        modelRole: profile?.role ?? '',
        plateId: id,
      ),
    );
    return data.message ?? '';
  }
}
