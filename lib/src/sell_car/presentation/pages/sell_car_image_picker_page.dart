import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/src/sell_car/domain/entities/settings_price.dart';
import 'package:dalalah/src/sell_car/presentation/pages/sell_car_image_picker_screen.dart';

import '../../../main_index.dart';
import '../bloc/sell_car_image_picker_bloc.dart';
import '../widgets/header_sell_car.dart';

class SellCarImagePickerPage extends BaseBlocWidget<DataSuccess<SettingsPrice>,
    SellCarImagePickerCubit> {
  SellCarImagePickerPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

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
  Widget buildWidget(BuildContext context, DataSuccess<SettingsPrice> state) {
    final args = getArguments(context);
    return SellCarImagePickerScreen(
        settingsPrice: state.data!,
        onSave: (params) {
          print('args in SellCarImagePickerPage ${params.toJson()}');
          args.price = params.price;
          args.installment = params.installment;
          args.description = params.description;
          args.mainImage = params.mainImage;
          args.images = params.images;
          bloc.sellCar(args);
        });
  }

  @override
  void onSuccessDismissed() {
    Navigators.pushNamedAndRemoveUntil(Routes.navigationPages);
  }
}
