
import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/sell_car/presentation/pages/sell_car_image_picker_screen.dart';

import '../../../home/presentation/bloc/home_bloc.dart';
import '../../../main_index.dart';
import '../bloc/sell_car_bloc.dart';
import 'sell_car_screen.dart';


class SellCarImagePickerPage extends BaseBlocWidget<UnInitState, HomeCubit> {
  SellCarImagePickerPage({Key? key}) : super(key: key);


  // @override
  // void loadInitialData(BuildContext context) {
  //   bloc.fetchShipments(1);
  // }

  // @override
  // String? title (context)=> strings.add_main_images;

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return SellCarImagePickerScreen(shipments: bloc.state.data);
  }

}
