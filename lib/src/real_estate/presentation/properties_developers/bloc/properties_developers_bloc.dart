import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../data/models/properties_developers.dart';
import '../../../domain/use_cases/real_estate_usecase.dart';

@Injectable()
class PropertiesDevelopersPageCubit extends BaseCubit {
  final RealEstateUseCase useCase;
  PropertiesDevelopersPageCubit(this.useCase);

  // Future<List<PropertiesDevelopers>> fetchPropertiesDevelopers()async {
  //  return executeSuccessNotLoading(() => useCase.fetchPropertiesDevelopers());
  // }
  List<PropertiesDevelopers> allPropertiesDevelopers = [];
  List<PropertiesDevelopers> propertiesDevelopers = [];
  int page = 1;

  fetchPropertiesDevelopers({bool isRefresh = true,}) async {
    isRefresh ? {page = 1, allPropertiesDevelopers.clear()} : page++;
    executeBuilder(
      isRefresh: isRefresh, () =>  useCase.fetchPropertiesDevelopers(page),
      onSuccess: (data) {
        propertiesDevelopers = data.map((e) => e).toList() ?? [];
        allPropertiesDevelopers.addAll(propertiesDevelopers);
        if(allPropertiesDevelopers.isEmpty){
          throw EmptyListException();
        } else {
          emit(DataSuccess<List<PropertiesDevelopers>>(allPropertiesDevelopers));
        }
      },
    );
  }
}
