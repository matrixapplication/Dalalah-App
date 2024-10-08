import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../data/models/request_price_dto.dart';
import '../repositories/base_price_requests_repo.dart';

@Injectable()
class PriceRequestsUseCase {
  final BasePriceRequestsRepo repository;

  PriceRequestsUseCase(this.repository);


  Future<String> priceRequest(int id) async{
    return await repository.priceRequest(id);
  }

  Future<ApiResponse<List<RequestPriceDto>>> fetchNotifications(int page) async {
    return await repository.fetchPriceRequests(page);
  }
}
