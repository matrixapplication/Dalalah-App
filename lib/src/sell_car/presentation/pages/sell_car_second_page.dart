import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/src/sell_car/presentation/pages/sell_car_second_screen.dart';

import '../../../main_index.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/entities/sell_car_args.dart';
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
    SellCarArgs args = getArguments(context);
    SellCarParams params = args.params ?? SellCarParams();
    print('car:status id ${args.car?.id}');
    return SellCarSecondScreen(
      car: args.car,
      state: state,
      onNext: (SellCarParams newParams) {
        newParams.id = params.id ?? 0;
        newParams.modelId = params.modelId ?? 0;
        newParams.modelRole = params.modelRole ?? '';
        newParams.status = params.status ?? '';
        newParams.brandId =  params.brandId ?? 0;
        newParams.carModelId =  params.carModelId ?? 0;
        newParams.carModelExtensionId =  params.carModelExtensionId ?? 0;
        newParams.year =  params.year ?? 0;
        newParams.newCarMiles =  params.newCarMiles ?? 0;
        newParams.regionalSpecificationKey =  params.regionalSpecificationKey ?? '1';
        pushNamed(Routes.sellCarPropertiesPage, arguments: SellCarArgs(
          car: args.car,
          params: newParams,
          isEdit: args.isEdit,
        ));
      },
      onPrevPressed: onPrevPressed,
    );
  }
}
