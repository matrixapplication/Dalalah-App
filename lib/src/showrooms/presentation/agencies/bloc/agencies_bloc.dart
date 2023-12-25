import 'package:dalalah/core/bloc/base_cubit.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../data/models/agency_params.dart';
import '../../../domain/entities/agency.dart';
import '../../../domain/use_cases/showrooms_usecase.dart';

@Injectable()
class AgencyCubit extends BaseCubit {
  final ShowroomsUseCase usecase;
  AgencyCubit(this.usecase);


  List<Agency> allCars = [];
  List<Agency> cars = [];
  int page = 0;
  bool isLastPage = false;

  fetchMyCars({bool isMoreData = false}) async {
    // !isMoreData ? {page = 1, allCars.clear()} : page++;
    // print('page onSuccess$page');
    // executeBuilder(
    //   isMoreData: isMoreData,
    //       () => usecase.fetchAgencies(AgencyParams(page: page,)),
    //   onSuccess: (data) {
    //     isLastPage = (data.pagination?.totalPages)! <= page;
    //     cars = data.data?.map((e) => Agency.fromDto(e)).toList() ?? [];
    //     if(cars.isEmpty){
    //       throw EmptyListException();
    //     } else {
    //       allCars.addAll(cars);
    //       emit(DataSuccess<List<Agency>>(allCars));
    //     }
    //   },
    // );
  }

}
