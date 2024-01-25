import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/plates/data/models/add_plate_params.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../sell_car/presentation/pages/ad_premium_screen.dart';
import '../../../domain/entities/ad_feature.dart';
import '../bloc/add_plate_bloc.dart';

class PlatePremiumPage
    extends BaseBlocWidget<DataSuccess<AdFeature?>, AddPlateCubit> {
  final bool isFilter;

  PlatePremiumPage({Key? key, this.isFilter = true}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAdFeature();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<AdFeature?> state) {
    return AddPremiumScreen(
      adFeature: state.data,
      onSave: ( adType) {
        AddPlateParams params = getArguments(context);
        params.adType = adType;
        bloc.addPlate(params);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    pushNamedAndRemoveUntil(Routes.navigationPages);
  }
}
