import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/src/sell_car/presentation/pages/sell_car_second_screen.dart';

import '../../../main_index.dart';
import '../../data/models/sell_car_params.dart';
import '../bloc/sell_car_second_bloc.dart';
import '../bloc/sell_car_second_state.dart';
import '../widgets/header_sell_car.dart';

class SellCarSecondPage extends BaseBlocWidget<SellCarSecondState, SellCarSecondCubit> {
  final Function(SellCarParams)? onNext;
  final Function()? onPrevPressed;
  SellCarSecondPage({Key? key,
    this.onNext,
    this.onPrevPressed,}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }


  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: HeaderSellCar(
        step: 2,
        buildConsumer: buildConsumer(context),
      ),
    );
  }


  @override
  Widget buildWidget(BuildContext context, SellCarSecondState state) {
    final args = getArguments(context);
    return SellCarSecondScreen(
      state: state,
      onNext: (SellCarParams params) {
        params.status = args.status;
        params.brandId = args.brandId;
        params.carModelId = args.carModelId;
        params.carModelExtensionId = args.carModelExtensionId;
        params.year = args.year;
        Navigators.pushNamed(Routes.sellCarPropertiesPage, arguments: params);
      },
      onPrevPressed: onPrevPressed,
    );
  }
}
