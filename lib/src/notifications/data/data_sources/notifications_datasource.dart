import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../models/notification_dto.dart';

part 'notifications_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  NotificationsDatasource{

  @factoryMethod
  factory NotificationsDatasource(Dio dio) = _NotificationsDatasource;

  @GET('/all_notification')
  Future<ApiResponse<List<NotificationDto>>> fetchNotifications();
}