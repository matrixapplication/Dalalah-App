import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/sell_car/data/models/sell_car_params.dart';
import '../../../../core/utils/navigator.dart';
import '../../../main_index.dart';
import '../../../plates/domain/entities/ad_feature.dart';
import '../bloc/sell_car_bloc.dart';
import 'ad_premium_screen.dart';


class CarPremiumPage
    extends BaseBlocWidget<DataSuccess<AdFeature>, SellCarCubit> {

  CarPremiumPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAdFeature();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<AdFeature> state) {
    return AddPremiumScreen(
      adFeature: state.data!,
      onSave: ( adType) {
        SellCarParams params = getArguments(context);
        params.adType = adType;
        bloc.sellCar(params);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    pushNamedAndRemoveUntil(Routes.navigationPages);
  }
}
