import 'package:dalalah/src/plates/domain/entities/plate.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../favorites_and_ads/data/models/add_to_favorite_params.dart';
import '../../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../data/models/showroom_plates_params.dart';
import '../../../domain/use_cases/showrooms_usecase.dart';

@Injectable()
class ShowroomPlateCubit extends BaseCubit {
  final ShowroomsUseCase usecase;
  final FavoritesUseCase favoritesUseCase;
  ShowroomPlateCubit(this.usecase, this.favoritesUseCase);

  List<Plate> allPlates = [];
  List<Plate> plates = [];
  ShowroomPlatesParams params = ShowroomPlatesParams();
  int page = 0;
  bool isLastPage = false;

  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  fetchShowroomPlates(int id, {bool isRefresh = true}) async {
    isRefresh ? {page = 1, allPlates.clear()} : page++;
    params.showroomId = id;
    params.page = page;
    executeBuilder(
      isRefresh: isRefresh,
          () => usecase.fetchShowroomPlates(params),
      onSuccess: (data) {
        isLastPage = (data.pagination?.totalPages)! <= page;
        plates = data.data?.map((e) => Plate.fromDto(e)).toList() ?? [];
        isLastPage ? refreshController.loadNoData() : refreshController.loadComplete();
        if(plates.isEmpty){
          throw EmptyListException();
        } else {
          allPlates.addAll(plates);
          emit(DataSuccess<List<Plate>>(allPlates));
        }
      },
    );
  }

  togglePlateFavorite(int id) async {
    executeEmitterListener(() => favoritesUseCase.toggleFavoriteCarOrPlate(AddToFavoriteParams(plateId: id)));
  }

}
