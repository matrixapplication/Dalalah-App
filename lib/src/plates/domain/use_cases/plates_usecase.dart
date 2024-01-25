
import 'package:injectable/injectable.dart';

import '../../../cars/data/models/add_special_params.dart';
import '../../data/models/add_plate_params.dart';
import '../../data/models/plate_filter_params.dart';
import '../entities/ad_feature.dart';
import '../entities/ad_types.dart';
import '../entities/plate.dart';
import '../repositories/base_plates_repo.dart';

@Injectable()
class PlatesUseCase {
  final BasePlatesRepo repository;

  PlatesUseCase(this.repository);

  Future<List<Plate>> fetchPlates(PlateFilterParams params) async {
   final data = await repository.fetchPlates(params);
    return data.data!.map((e) => Plate.fromDto(e)).toList();
  }

  Future<String> toggleFavoritePlate(int id) async {
    return await repository.toggleFavoritePlate(id);
  }

  Future<dynamic> addPlate(AddPlateParams params) async {
    final data=  await repository.addPlate(params);
    return params.adType == AdTypes.featured ? data.data! : data.message;
  }
  Future<dynamic> editPlate(AddPlateParams params) async {
    final data=  await repository.editPlate(params);
    return params.adType == AdTypes.featured ? data.data! : data.message;
  }

  Future<AdFeature> fetchAdFeature() async {
    final data = await repository.fetchAdFeature();
    return AdFeature.fromDto(data.data!);
  }

  Future<void> hidePlate(int id) async {
    await repository.hidePlate(id);
  }

  Future<void> soldPlate(int id) async {
    await repository.soldPlate(id);
  }

  Future<void> addSpecialPlate(AdSpecialParams params) async {
    await repository.addSpecialPlate(params);
  }
}