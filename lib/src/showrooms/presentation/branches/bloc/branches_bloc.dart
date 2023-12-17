import 'package:dalalah/core/bloc/base_cubit.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/showrooms_usecase.dart';

@Injectable()
class BranchesCubit extends BaseCubit {
  final ShowroomsUseCase useCase;
  BranchesCubit(this.useCase);


  void fetchBranchesById(int id) {
    print('fetchBranchesById');
    executeSuccess(() => useCase.fetchBranchesById(id));
  }
}
