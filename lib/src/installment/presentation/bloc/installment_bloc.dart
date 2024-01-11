
import 'package:dalalah/core/commen/common_state.dart';
import 'package:dalalah/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/exceptions/empty_list_exception.dart';
import '../../../../core/resources/data_state.dart';
import '../../../home/domain/entities/car.dart';
import '../../data/models/installment_calculation_params.dart';
import '../../data/models/installment_cars_params.dart';
import '../../domain/use_cases/installment_usecase.dart';

@Injectable()
class InstallmentBloc extends BaseCubit {
  final InstallmentUseCase usecase;

  InstallmentBloc(this.usecase);

  StreamStateInitial<int?> installmentValueStream = StreamStateInitial();

  ProfileDto? profileDto = ProfileDto();

  List<Car> allCars = [];
  List<Car> cars = [];
  InstallmentCarsParams params = InstallmentCarsParams();
  int page = 0;
  bool isLastPage = false;

  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  fetchShowroomCars(int installment, {bool isRefresh = true}) async {
    isRefresh ? {page = 1, allCars.clear()} : page++;
    params.installment = installment;
    params.page = page;
    executeBuilder(
      isRefresh: isRefresh,
          () => usecase.filterCarsByInstallment(params),
      onSuccess: (data) {
        isLastPage = (data.pagination?.totalPages)! <= page;
        cars = data.data?.map((e) => Car.fromDto(e)).toList() ?? [];
        isLastPage ? refreshController.loadNoData() : refreshController.loadComplete();
        if(cars.isEmpty){
          throw EmptyListException();
        } else {
          allCars.addAll(cars);
          emit(DataSuccess<List<Car>>(allCars));
        }
      },
    );
  }

  fetchInstallmentValue(InstallmentCalculationParams params) async {
    executeListener(() => usecase.fetchInstallmentValue(params),
        onSuccess: (value) {
          installmentValueStream.setData(value);
          emit((SuccessStateListener(value)));
    });
  }
}
