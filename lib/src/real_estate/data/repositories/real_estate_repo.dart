
import 'package:injectable/injectable.dart';

import '../../domain/entities/real_estate.dart';
import '../../domain/repositories/base_real_estate_repo.dart';
import '../data_sources/real_estate_datasource.dart';
import '../models/category_details_dto.dart';
import '../models/real_estate_type_dto.dart';


@Injectable(as: BaseRealEstateRepo)
class RealEstateRepo extends BaseRealEstateRepo{
  final RealEstateDatasource  datasource;
  RealEstateRepo(this.datasource);

  @override
  Future<List<RealEstateCategoryDto>> fetchRealEstateCategories() async{
    final data = await datasource.fetchRealEstateCategories();
    return data.data!;
  }
  @override
  Future<RealEstateCategoryDetailsDto> fetchRealEstateCategoriesDetails(int id) async{
     final data = await datasource.fetchRealEstateCategoriesDetails(id);
    return data.data!;
  }

}