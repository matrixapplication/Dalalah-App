import 'package:dalalah/src/main_index.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../domain/entities/request_price.dart';
import '../../domain/use_cases/price_requests_usecase.dart';

@Injectable()
class PriceRequestsCubit extends BaseCubit {
  final PriceRequestsUseCase usecase;

  PriceRequestsCubit(this.usecase);

  Future<void> priceRequest(int id) async {
    executeEmitterListener(() => usecase.priceRequest(id));
  }

  List<RequestPrice> allCars = [];
  List<RequestPrice> cars = [];
  int page = 0;
  bool isLastPage = false;

  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  fetchShowroomCars({bool isRefresh = true}) async {
    isRefresh ? {page = 1, allCars.clear()} : page++;
    executeBuilder(
      isRefresh: isRefresh,
          () => usecase.fetchNotifications(page),
      onSuccess: (data) {
        isLastPage = (data.pagination?.totalPages)! <= page;
        isLastPage ? refreshController.loadNoData() : refreshController.loadComplete();
        cars = data.data?.map((e) => RequestPrice.fromJson(e)).toList() ?? [];
        allCars.addAll(cars);
        emit(DataSuccess<List<RequestPrice>>(allCars));
        // if(cars.isEmpty){
        //   throw EmptyListException();
        // } else {
        // }
      },
    );
  }


}
