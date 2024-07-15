import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/base_cubit.dart';
import '../../../domain/use_cases/real_estate_usecase.dart';

@Injectable()
class RealEstatePageCubit extends BaseCubit {
  final RealEstateUseCase usecase;
  RealEstatePageCubit(this.usecase);
  fetchNotifications() async {
    executeSuccess(() => usecase.fetchNotifications());
  }
}
