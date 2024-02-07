
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dalalah/core/network/api_response.dart';

import '../../../../core/utils/constants.dart';
import '../../../home/data/models/car_dto.dart';
import '../models/featured_payment_params.dart';
import '../models/package_dto.dart';
import '../models/payment_log_params.dart';
import '../models/payment_status_dto.dart';


part 'payment_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  PaymentDataSource{

  @factoryMethod
  factory PaymentDataSource(Dio dio) = _PaymentDataSource;

  @GET('/packages')
  Future<ApiResponse<List<PackageDto>>> fetchPackages();

  @POST('/featured_payment')
  Future<ApiResponse> addFeaturedPaymentAd(@Body() FeaturedPaymentParams params);

  @POST('/package_payment')
  Future<ApiResponse> selectPackagePayment(@Queries() PaymentLogParams params);

  @GET('/payment-status')
  Future<ApiResponse<PaymentStatusDto>> fetchPaymentStatus();
}