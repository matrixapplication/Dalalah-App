import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/src/sell_car/domain/entities/settings_price.dart';
import 'package:dalalah/src/sell_car/presentation/pages/sell_car_image_picker_screen.dart';

import '../../../home/domain/entities/car.dart';
import '../../../main_index.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/entities/sell_car_args.dart';
import '../bloc/sell_car_image_picker_bloc.dart';
import '../widgets/header_sell_car.dart';

class SellCarImagePickerPage extends BaseBlocWidget<UnInitState,
    SellCarImagePickerCubit> {
  SellCarImagePickerPage({Key? key}) : super(key: key);

  // @override
  // void loadInitialData(BuildContext context) {
  //   bloc.fetchInitialData();
  // }

  // @override
  // String? title(BuildContext context) => '';

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: HeaderSellCar(
        step: 4,
        buildConsumer: buildConsumer(context),
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    SellCarArgs args = getArguments(context);
    return SellCarImagePickerScreen(
        car: args.car ?? Car(),
        onSave: (params) {
          print('args in SellCarImagePickerPage ${params.toJson()}');
          args.params?.price = params.price;
          args.params?.installment = params.installment;
          args.params?.description = params.description;
          args.params?.mainImage = params.mainImage;
          args.params?.images = params.images;
          bloc.sellCar(args.params ?? SellCarParams());
        });
  }

  @override
  void onSuccessDismissed() {
    Navigators.pushNamedAndRemoveUntil(Routes.addPremiumPage);
  }
}
