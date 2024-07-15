import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../domain/use_cases/real_estate_usecase.dart';


@Injectable()
class AddRealEstatePageCubit extends BaseCubit {
  final RealEstateUseCase usecase;

  AddRealEstatePageCubit(this.usecase);

  fetchNotifications() async {
    executeSuccess(() => usecase.fetchNotifications());
  }
}
