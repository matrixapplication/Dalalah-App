import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/showroom.dart';
import '../../../domain/use_cases/showrooms_usecase.dart';

@Injectable()
class FollowedShowroomsCubit extends BaseCubit {
  final ShowroomsUseCase usecase;
  FollowedShowroomsCubit(this.usecase);

  List<Showroom> allShowrooms = [];
  List<Showroom> showrooms = [];
  int page = 0;
  bool isLastPage = false;

  fetchFollowShowrooms({bool isMoreData = false}) async {
    !isMoreData ? {page = 1, allShowrooms.clear()} : page++;
    executeBuilder(
      isRefresh: isMoreData,
          () => usecase.fetchFollowShowrooms(page),
      onSuccess: (data) {
        isLastPage = (data.pagination?.totalPages ?? 0) <= page;
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
