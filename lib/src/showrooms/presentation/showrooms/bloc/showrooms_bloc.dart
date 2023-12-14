import 'package:dalalah/core/bloc/base_cubit.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/showrooms_usecase.dart';

@Injectable()
class ShowroomsCubit extends BaseCubit {
  final ShowroomsUseCase useCase;
  ShowroomsCubit(this.useCase);


  void fetchShowrooms() {
    executeSuccess(() => useCase.fetchShowrooms(1));
  }
}
