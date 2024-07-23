import 'package:dalalah/src/real_estate/data/models/add_real_estate_params.dart';
import 'package:dalalah/src/real_estate/data/models/get_real_estate_params.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/real_estate.dart';
import '../../domain/repositories/base_real_estate_repo.dart';
import '../data_sources/real_estate_datasource.dart';
import '../models/category_details_dto.dart';
import '../models/real_estate_model.dart';
import '../models/real_estate_type_dto.dart';

@Injectable(as: BaseRealEstateRepo)
class RealEstateRepo extends BaseRealEstateRepo {
  final RealEstateDatasource datasource;

  RealEstateRepo(this.datasource);

  @override
  Future<List<RealEstateCategoryDto>> fetchRealEstateCategories() async {
    final data = await datasource.fetchRealEstateCategories();
    return data.data!;
  }

  @override
  Future<RealEstateCategoryDetailsDto> fetchRealEstateCategoriesDetails(
      int id) async {
    final data = await datasource.fetchRealEstateCategoriesDetails(id);
    return data.data!;
  }

  @override
  Future<RealEstatesModel> fetchRealEstates(AddRealEstateParams params) async {
    final data = await datasource.fetchRealEstates(
      // 'rent',
      // 'residential'
      //خصوصي
    );
    print("yehya repo ${data.data!.toJson().toString()}");
    return data.data!;
  }

  @override
  Future<String> addRealEstate(AddRealEstateParams params) async {
    final data = await datasource.addRealEstate(
      params.type ?? '',
      params.status ?? '',
      params.categoryId ?? 0,
      params.price ?? 0,
      params.description ?? '',
      params.cityId ?? 0,
      params.streetName ?? '',
      params.lat ?? '',
      params.lng ?? '',
      params.features ?? [],
      params.cover!,
      params.images ?? [],
      params.detailsList?.map((e) => e.id?.toString() ?? '0').toList() ?? [],
      params.detailsList?.map((e) => e.title ?? '0').toList() ?? [],
    );
    return data.message!;
  }
}
