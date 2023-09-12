import 'package:injectable/injectable.dart';

import '../../../../../../core/bloc/base_cubit.dart';
import '../../domain/use_cases/filter_usecase.dart';

@Injectable()
class FilterCubit extends BaseCubit {
  final FilterUseCase usecase;

  FilterCubit(this.usecase);

  fetchNotifications() async {

  }
}
