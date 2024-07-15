import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/base_cubit.dart';
import '../../../domain/use_cases/real_estate_usecase.dart';

@Injectable()
class FilterRealEstatePageCubit extends BaseCubit {
  final RealEstateUseCase usecase;

  FilterRealEstatePageCubit(this.usecase);

  fetchNotifications() async {
    executeSuccess(() => usecase.fetchNotifications());
  }
}
