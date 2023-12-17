import 'package:dalalah/core/bloc/base_cubit.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/showroom.dart';
import '../../../domain/use_cases/showrooms_usecase.dart';

@Injectable()
class ShowroomsCubit extends BaseCubit {
  final ShowroomsUseCase useCase;
  ShowroomsCubit(this.useCase);

  List<Showroom> allShowrooms = [];
  List<Showroom> showrooms = [];
  int page = 1;

  fetchShowrooms({bool isRefresh = true}) async {
    isRefresh ? {page = 1, allShowrooms.clear()} : page++;
    executeBuilder(
      isMoreData: isRefresh,
          () => useCase.fetchShowrooms(page),
      onSuccess: (data) {
        showrooms = data.data?.map((e) => Showroom.fromDto(e)).toList() ?? [];
        allShowrooms.addAll(showrooms);
        emit(DataSuccess<List<Showroom>>(allShowrooms));
      },
    );
  }
}
