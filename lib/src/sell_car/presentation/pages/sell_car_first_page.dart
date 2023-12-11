import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/home/presentation/bloc/home_bloc.dart';
import 'package:dalalah/src/sell_car/presentation/pages/sell_car_first_screen.dart';
import 'package:dalalah/src/sell_car/presentation/pages/sell_car_second_screen.dart';

import '../../../main_index.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/entities/shipment.dart';
import '../bloc/sell_car_bloc.dart';
import '../bloc/sell_car_state.dart';
import 'sell_car_screen.dart';

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

  // @override
  // String? title(context)=> strings.sell_car;

  @override
  bool hasAppBar(BuildContext context) => false;

  @override
  Widget buildWidget(BuildContext context, FirstPageSellCarState state) {
    print('state.data ${state.data}');
    return SellCarSecondScreen(
      state: state,
      onNext: (SellCarParams params) {
        onNext!(params);
      },
      onPrevPressed: onPrevPressed,
    );
  }
}
