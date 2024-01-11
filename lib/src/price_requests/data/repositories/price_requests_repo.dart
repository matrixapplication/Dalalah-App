
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../domain/repositories/base_price_requests_repo.dart';
import '../data_sources/price_requests_datasource.dart';
import '../models/notification_dto.dart';


@Injectable(as: BasePriceRequestsRepo)
class WalletRepo extends BasePriceRequestsRepo{
  final PriceRequestsDatasource  datasource;
  WalletRepo(this.datasource);


  @override
  Future<String> priceRequest(int id) async{
    final response =  await datasource.priceRequest(id);
    return response.message ?? '';
  }

  @override
  Future<ApiResponse<List<NotificationDto>>> fetchPriceRequests( int page) async{
    return await datasource.fetchPriceRequests(page);
  }

}