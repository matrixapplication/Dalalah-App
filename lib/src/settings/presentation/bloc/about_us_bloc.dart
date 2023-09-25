import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../domain/entities/about_us_types_.dart';
import '../../domain/use_cases/settings_usecase.dart';

@Injectable()
class AboutUsCubit extends BaseCubit {
  final SettingsUseCase usecase;

  AboutUsCubit(this.usecase);

  fetchInitialData(AboutUsTypes type) async {
    executeSuccess(() => type == AboutUsTypes.ABOUT_US
        ? usecase.fetchAboutUs()
        : type == AboutUsTypes.BUYING_AND_SELLING_ABOUT
            ? usecase.fetchBuyingAndSellingAbout()
            : type == AboutUsTypes.TERMS_AND_CONDITIONS
                ? usecase.fetchTermsAndConditions()
                : usecase.fetchPrivacy());
  }
}
