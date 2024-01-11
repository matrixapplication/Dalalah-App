
import 'package:dalalah/core/network/api_response.dart';

import '../../data/models/notification_dto.dart';

abstract class BasePriceRequestsRepo {
  Future<String> priceRequest(int id);
  Future<ApiResponse<List<NotificationDto>>> fetchPriceRequests( int page);
}
