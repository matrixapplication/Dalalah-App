
import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/home/presentation/bloc/home_bloc.dart';

import '../../../main_index.dart';
import '../../domain/entities/shipment.dart';
import '../bloc/sell_car_bloc.dart';
import 'sell_car_screen.dart';


class SellCarPage extends BaseBlocWidget<UnInitState, HomeCubit> {
  SellCarPage({Key? key}) : super(key: key);


  // @override
  // void loadInitialData(BuildContext context) {
  //   bloc.fetchClientStatus();
  // }

  // @override
  // String? title(context)=> strings.sell_car;

  @override
  bool hasAppBar(BuildContext context) => false;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    print('state.data ${state.data}');
    return SellCarScreen(shipments: bloc.state.data);
  }
}
