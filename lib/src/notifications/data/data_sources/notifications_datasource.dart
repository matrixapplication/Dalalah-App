import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:delala/core/network/api_response.dart';
import 'package:delala/core/utils/constants.dart';

import '../../domain/entities/notification.dart';

part 'notifications_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  NotificationsDatasource{

  @factoryMethod
  factory NotificationsDatasource(Dio dio) = _NotificationsDatasource;

  @GET('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<List<Notifications>>> fetchNotifications();
}