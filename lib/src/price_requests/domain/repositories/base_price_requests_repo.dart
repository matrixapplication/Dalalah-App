
import 'package:dalalah/core/network/api_response.dart';

import '../../data/models/request_price_dto.dart';

abstract class BasePriceRequestsRepo {
  Future<String> priceRequest(int id);
  Future<ApiResponse<List<RequestPriceDto>>> fetchPriceRequests( int page);
}
