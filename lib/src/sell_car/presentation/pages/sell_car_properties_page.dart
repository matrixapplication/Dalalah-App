
import 'package:delala/core/components/base_widget_bloc.dart';
import 'package:delala/src/sell_car/presentation/pages/sell_car_properties_screen.dart';

import '../../../home/presentation/bloc/home_bloc.dart';
import '../../../main_index.dart';
import '../../domain/entities/shipment.dart';
import '../bloc/sell_car_bloc.dart';
import 'sell_car_screen.dart';


class SellCarPropertiesPage extends BaseBlocWidget<UnInitState, HomeCubit> {
  final int type;
  SellCarPropertiesPage({Key? key, this.type = 1}) : super(key: key);

  //
  // @override
  // void loadInitialData(BuildContext context) {
  //   bloc.fetchClientStatus();
  // }

  @override
  String? title (context)=> strings.select_properties;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return SellCarPropertiesScreen(shipments: bloc.state.data);
  }

}
