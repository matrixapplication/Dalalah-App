import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/sell_car/presentation/pages/sell_car_first_screen.dart';

import '../../../../core/utils/navigator.dart';
import '../../../main_index.dart';
import '../../data/models/sell_car_params.dart';
import '../bloc/sell_car_bloc.dart';
import '../bloc/sell_car_state.dart';
import '../widgets/header_sell_car.dart';

class SellCarFirstPage extends BaseBlocWidget<FirstPageSellCarState, SellCarCubit> {
  final Function(SellCarParams)? onNext;
  final Function()? onPrevPressed;
  SellCarFirstPage({Key? key,
    this.onNext,
    this.onPrevPressed,}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFirstInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: HeaderSellCar(
        step: 1,
        buildConsumer: buildConsumer(context),
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context, FirstPageSellCarState state) {
    print('state.data ${state.data}');
    return SellCarFirstScreen(
      state: state,
      onNext: (SellCarParams params) {
       // onNext!(params);
        Navigators.pushNamed(Routes.sellCarSecondPage, arguments: params);
      },
      onFetchBrandModels: (brandId) {
        bloc.fetchBrandModels(brandId);
      },
      onFetchBrandModelsExtension: (carModelId) {
        bloc.fetchBrandModelExtensions(carModelId);
      },
      onPrevPressed: onPrevPressed,
    );
  }
}
