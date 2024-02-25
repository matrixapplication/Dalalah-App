import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/src/sell_car/data/models/sell_car_params.dart';
import '../../../../main_index.dart';
import '../../../../plates/domain/entities/ad_feature.dart';
import '../../../../sell_car/presentation/pages/ad_premium_screen.dart';
import '../../../domain/entites/ad_args.dart';
import '../bloc/add_premium_ad_bloc.dart';

class AddPremiumADPage
    extends BaseBlocWidget<DataSuccess<AdFeature?>, AddPremiumADCubit> {
  AddPremiumADPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAdFeature();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<AdFeature?> state) {
    return AddPremiumScreen(
      adFeature: state.data,
      isFromMyAds: true,
      onSave: (adType) {
        ADArgs args = getArguments(context);
        bloc.addFeaturedPaymentAd(
            args.id ?? 0,
            state.data?.featureDurationPrice ?? '0',
            args.type ?? '',
        );
      },
    );
  }

  @override
  void onSuccessDismissed() {
    pop(arguments: true);
  }
}
