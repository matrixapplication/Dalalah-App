import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../showrooms/data/models/add_rate_params.dart';
import '../../../data/models/add_rate_developer_params.dart';
import '../../../data/models/properties_developer_details.dart';
import '../../../data/models/properties_developers.dart';
import '../../../domain/use_cases/real_estate_usecase.dart';

@Injectable()
class PropertiesDevelopersPageCubit extends BaseCubit {
  final RealEstateUseCase useCase;
  PropertiesDevelopersPageCubit(this.useCase);

  Future<PropertiesDeveloperDetails> fetchPropertiesDevelopersDetails(int id)async {
   return executeSuccessNotLoading(() => useCase.fetchPropertiesDevelopersDetails(id));
  }
  List<PropertiesDevelopers> allPropertiesDevelopers = [];
  List<PropertiesDevelopers> propertiesDevelopers = [];
  int page = 1;
  bool isLastPage = false;

  fetchPropertiesDevelopers({bool isRefresh = true,}) async {
    isRefresh ? {page = 1, allPropertiesDevelopers.clear()} : page++;
    executeBuilder(
      isRefresh: isRefresh, () =>  useCase.fetchPropertiesDevelopers(page),
      onSuccess: (data) {
        isLastPage = data.pagination?.currentPage == data.pagination?.totalPages;
        propertiesDevelopers = data.data?.map((e) => e).toList() ?? [];
        allPropertiesDevelopers.addAll(propertiesDevelopers);
        if(allPropertiesDevelopers.isEmpty){
          throw EmptyListException();
        } else {
          emit(DataSuccess<List<PropertiesDevelopers>>(allPropertiesDevelopers));
        }
      },
    );
  }
  void addFollowDeveloper(int id) {
    executeEmitterListener(() => useCase.addFollowDeveloper(id));
  }

  void addRateDeveloper(AddRateDeveloperParams params) {
    executeEmitterListener(() => useCase.addRateDeveloper(params));
  }
}
