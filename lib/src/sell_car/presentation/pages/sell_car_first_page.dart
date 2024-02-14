import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/sell_car/presentation/pages/sell_car_first_screen.dart';

import '../../../../core/utils/navigator.dart';
import '../../../home/domain/entities/car.dart';
import '../../../main_index.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/entities/sell_car_args.dart';
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
    Car? car = getArguments(context) is Car ? getArguments(context) : null;
    bloc.fetchFirstInitialData(car);
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
    Car? car = getArguments(context) is Car ? getArguments(context) : null;
    print('car:status ${car?.status?.name}');
    return SellCarFirstScreen(
      car: car,
      state: state,
      onNext: (SellCarParams params) {
       // onNext!(params);
       pushNamed(Routes.sellCarSecondPage, arguments: SellCarArgs(
          car: car,
          params: params,
          isEdit: car?.id != null,
        ));
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
