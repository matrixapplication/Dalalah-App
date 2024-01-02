

import 'package:dalalah/core/bloc/base_cubit.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/add_rate_params.dart';
import '../../../domain/use_cases/showrooms_usecase.dart';


@Injectable()
class ShowroomDetailsCubit extends BaseCubit {
  final ShowroomsUseCase useCase;
  ShowroomDetailsCubit(this.useCase);



  void fetchShowroomDetails(int id) {
    executeSuccess(() => useCase.fetchShowroomDetails(id));
  }

  void addFollowShowrooms(int id) {
    executeEmitterListener(() => useCase.addFollowShowrooms(id));
  }

  void addRateShowroom(AddRateParams params) {
    executeEmitterListener(() => useCase.addRateShowroom(params));
  }

}