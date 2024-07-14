import 'package:dalalah/core/bloc/base_cubit.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../data/models/agency_params.dart';
import '../../../domain/entities/showroom.dart';
import '../../../domain/use_cases/showrooms_usecase.dart';

@Injectable()
class ShowroomsCubit extends BaseCubit {
  final ShowroomsUseCase useCase;
  ShowroomsCubit(this.useCase);

  List<Showroom> allShowrooms = [];
  List<Showroom> showrooms = [];
  int page = 1;

  fetchShowrooms({bool isRefresh = true, bool isAgency = false}) async {
    isRefresh ? {page = 1, allShowrooms.clear()} : page++;
    executeBuilder(
      isRefresh: isRefresh,
          () => isAgency ? useCase.fetchAgencies(AgencyParams(page: page)) : useCase.fetchShowrooms(page),
      onSuccess: (data) {
        showrooms = data.data?.map((e) => Showroom.fromDto(e)).toList() ?? [];
        allShowrooms.addAll(showrooms);
        if(allShowrooms.isEmpty){
          throw EmptyListException();
        } else {
          emit(DataSuccess<List<Showroom>>(allShowrooms));
        }
      },
    );
  }
}
