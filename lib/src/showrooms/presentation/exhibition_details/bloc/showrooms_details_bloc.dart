

import 'package:dalalah/core/bloc/base_cubit.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/showrooms_usecase.dart';


@Injectable()
class ShowroomDetailsCubit extends BaseCubit {
  final ShowroomsUseCase useCase;
  ShowroomDetailsCubit(this.useCase);



  void fetchShowrooms() {
    executeSuccess(() => useCase.fetchShowrooms(1));
  }
}