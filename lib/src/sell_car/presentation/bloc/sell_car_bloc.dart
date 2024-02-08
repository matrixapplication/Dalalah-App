import 'dart:convert';

import 'package:dalalah/src/sell_car/domain/entities/car_status.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/commen/common_state.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../home/domain/entities/car.dart';
import '../../../payment/data/models/featured_payment_params.dart';
import '../../../payment/domain/entities/payment_requests.dart';
import '../../../payment/domain/use_cases/payment_usecase.dart';
import '../../../plates/domain/entities/ad_feature.dart';
import '../../../plates/domain/entities/ad_types.dart';
import '../../../plates/domain/use_cases/plates_usecase.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/use_cases/sell_car_usecase.dart';
import 'sell_car_state.dart';

@Injectable()
class SellCarCubit extends BaseCubit {
  final SellCarUseCase usecase;
  final PlatesUseCase platesUseCase;
  final PaymentUseCase paymentUseCase;

  SellCarCubit(this.usecase, this.platesUseCase, this.paymentUseCase);

  StreamStateInitial<List<DropDownItem>> brandsModelsStream =
      StreamStateInitial<List<DropDownItem>>();
  StreamStateInitial<List<DropDownItem>> brandsModelsExtensionStream =
      StreamStateInitial<List<DropDownItem>>();
  StreamStateInitial<List<DropDownItem>> districtsStream =
      StreamStateInitial<List<DropDownItem>>();

  fetchFirstInitialData(Car? car) async {
    emit(DataLoading());
    try {
      final carStatuses = await usecase.fetchCarStatuses();
      final brands = await usecase.fetchBrands();
      final years = await usecase.fetchYears();
      if (car != null) {
        await fetchBrandModels(car.brand?.id ?? 0);
        await fetchBrandModelExtensions(car.brandModel?.id ?? 0);
      }

      emit(
        FirstPageSellCarState(
          carStatuses: carStatuses,
          brands: brands,
          years: years,
          brandsModelsStream: brandsModelsStream,
          brandsModelsExtensionStream: brandsModelsExtensionStream,
        ),
      );
    } on Exception catch (e) {
      emit(DataFailed(e));
    }
  }

  // Future<void> sellCar(SellCarParams params) async {
  //   executeEmitterListener(() => (params.id == null || params.id == 0)
  //       ? addCarAsFeatured(params)
  //       : usecase.editCar(params));
  // }

  Future<void> sellCar(SellCarParams params) async {
    emit(LoadingStateListener());
    FeaturedPaymentParams logParams = FeaturedPaymentParams();
    dynamic idOrMsg = 0;
    try {

      if(params.id == null || params.id == 0){
        idOrMsg = params.status == CarStatus.newCar
            ? await usecase.addNewCar(params)
            : await usecase.sellCar(params);
      } else {
        idOrMsg = await usecase.editCar(params);
      }
      if(params.adType == AdTypes.featured){
        params.id = idOrMsg;
         final data = await PaymentRequests.urWayPayment(
            id: idOrMsg.toString(), amount: params.price.toString());
        print('Result in Main is $data');
         logParams =
        FeaturedPaymentParams.fromJson(jsonDecode(data));
        logParams.adId = idOrMsg;
        logParams.adType = AdTypes.car;
        idOrMsg = await paymentUseCase.addFeaturedPaymentAd(logParams);
      }
      emit(SuccessStateListener<String>(idOrMsg));
    } catch (e) {
      emit(FailureStateListener(e));
      rethrow;
    }
  }

  fetchBrandModels(int id) async {
    brandsModelsStream.setData([]);
    try {
      final brands = await usecase.fetchBrandModels(id);
      final dropDownItems = brands
          .map((e) => DropDownItem(id: e.id.toString(), title: e.name))
          .toList();
      brandsModelsStream.setData(dropDownItems);
    } on Exception catch (e) {
      brandsModelsStream.setError(e);
    }
  }

  fetchBrandModelExtensions(int id) async {
    brandsModelsExtensionStream.setData([]);
    try {
      final brandsModelExtensions = await usecase.fetchBrandModelExtensions(id);
      final dropDownItems = brandsModelExtensions
          .map((e) => DropDownItem(id: e.id.toString(), title: e.name))
          .toList();
      brandsModelsExtensionStream.setData(dropDownItems);
    } on Exception catch (e) {
      brandsModelsExtensionStream.setError(e);
    }
  }

  fetchFeatures() {
    executeSuccess(() => usecase.fetchFeatures());
  }

  fetchAdFeature() {
    executeBuilder(() => paymentUseCase.fetchPaymentStatus(), isRefresh: true, onSuccess: (data)  async {
      print('fetchPaymentStatus ${data.isHide}');
      if(data.isHide == true){
        emit(const DataSuccess<AdFeature?>(null));
      } else{
        final data2 = await platesUseCase.fetchAdFeature();
        print('fetchAdFeature ${data2}');
        emit(DataSuccess<AdFeature?>(data2));
      }
    });
  }
}
