import 'package:dalalah/src/real_estate/data/models/real_estate_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../plates/data/models/plate_dto.dart';
import '../../data/models/add_real_estate_params.dart';
import '../../data/models/category_details_dto.dart';
import '../../data/models/get_real_estate_params.dart';
import '../../data/models/real_estate_type_dto.dart';
import '../entities/real_estate.dart';
import '../repositories/base_real_estate_repo.dart';

@Injectable()
class RealEstateUseCase {
  final BaseRealEstateRepo repository;

  RealEstateUseCase(this.repository);

  Future<List<RealEstateCategoryDto>> fetchRealEstateCategories() async {
    return await repository.fetchRealEstateCategories();
  }
  Future<RealEstateCategoryDetailsDto> fetchRealEstateCategoriesDetails(int id) async {
    return await repository.fetchRealEstateCategoriesDetails(id);
  }

  Future<dynamic> addRealEstate(AddRealEstateParams params) async {
    return await repository.addRealEstate(params);
  }
  Future<RealEstatesModel> fetchRealEstates(AddRealEstateParams params) async {
    return await repository.fetchRealEstates(params);
  }

  Future<List<Notifications>> fetchNotifications() async {
  //  return await repository.fetchNotifications();
    return [
      Notifications(
        id: 1,
        image: 'https://www.almrsal.com/wp-content/uploads/2019/12/1-1.jpg',
        date: '5 days ago',
        title: 'Sell Your Car In Egypt. Fast',
        time: '5 days ago',
        description: 'Free & Just in One minute Choose your car information → Upload you car images → Get interested calls instantly',
      ),
    ];
  }
}
