

import 'package:dalalah/core/bloc/base_cubit.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/add_rate_params.dart';
import '../../../domain/use_cases/showrooms_usecase.dart';


@Injectable()
class ShowroomDetailsCubit extends BaseCubit {
  final ShowroomsUseCase useCase;
  ShowroomDetailsCubit(this.useCase);



  void fetchShowrooms() {
    executeSuccess(() => useCase.fetchShowrooms(1));
  }

  void addFollowShowrooms(int id) {
    executeSuccess(() => useCase.addFollowShowrooms(id));
  }

  void addRateShowroom(AddRateParams params) {
    executeSuccess(() => useCase.addRateShowroom(params));
  }

}