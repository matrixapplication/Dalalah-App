import 'package:dalalah/src/plates/domain/entities/ad_types.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../cars/data/models/add_special_params.dart';
import '../../../../plates/domain/entities/plate.dart';
import '../../../../plates/domain/use_cases/plates_usecase.dart';
import '../../../../real_estate/domain/use_cases/real_estate_usecase.dart';
import '../../../data/models/add_to_favorite_params.dart';
import '../../../../real_estate/data/models/my_properties_response.dart';
import '../../../domain/use_cases/favorites_usecase.dart';

@Injectable()
class MyRealEstateCubit extends BaseCubit {
  final FavoritesUseCase usecase;
  final RealEstateUseCase realEstateUseCase;

  MyRealEstateCubit(this.usecase, this.realEstateUseCase, );


  List<Property> allProperties = [];
  int page = 0;
  bool isLastPage = false;

  fetchMyRealEstates({bool isRefresh = true}) async {
    isRefresh ? {page = 1, allProperties.clear()} : page++;
    List<Property> properties = [];
    executeBuilder(
      isRefresh: isRefresh,
          () => usecase.fetchMyRealEstate(page),
      onSuccess: (data) {
        isLastPage = (data.pagination?.totalPages)! <= page;
        properties = data.data!;
        allProperties.addAll(properties);
        if(allProperties.isEmpty){
          throw EmptyListException();
        } else {
          emit(DataSuccess<List<Property>>(allProperties));
        }
      },
    );
  }

  void hideProperty(int id) async {
    executeEmitterListener(() => realEstateUseCase.hideProperty(id));
  }

  void soldProperty(int id) async {
    // executeEmitterListener(() => realEstateUseCase.soldProperty(id));
  }

  void addSpecialProperty(int id) async {
    // executeEmitterListener(() => realEstateUseCase.addSpecialProperty(AdSpecialParams(id: id, type: AdTypes.featured)));
  }

  void deleteProperty(int id) async {
    executeEmitterListener(() => realEstateUseCase.deleteProperty(id));
  }

  void updatePropertyDate(int id) async {
    executeEmitterListener(() => realEstateUseCase.updatePropertyDate(id));
  }



}
