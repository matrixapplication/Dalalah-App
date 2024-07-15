
import 'package:injectable/injectable.dart';

import '../../domain/entities/real_estate.dart';
import '../../domain/repositories/base_real_estate_repo.dart';
import '../data_sources/real_estate_datasource.dart';


@Injectable(as: BaseRealEstateRepo)
class RealEstateRepo extends BaseRealEstateRepo{
  final RealEstateDatasource  datasource;
  RealEstateRepo(this.datasource);

  @override
  Future<List<Notifications>> fetchNotifications() async{
    final data = await datasource.fetchNotifications();
    return data.data!;
  }

}