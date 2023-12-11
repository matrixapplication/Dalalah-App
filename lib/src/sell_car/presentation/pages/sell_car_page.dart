import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/home/presentation/bloc/home_bloc.dart';
import 'package:dalalah/src/sell_car/presentation/pages/sell_car_first_screen.dart';

import '../../../main_index.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/entities/shipment.dart';
import '../bloc/sell_car_bloc.dart';
import '../bloc/sell_car_state.dart';
import 'sell_car_screen.dart';

class SellCarPage extends BaseBlocWidget<FirstPageSellCarState, SellCarCubit> {
  SellCarPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFirstInitialData();
  }

  // @override
  // String? title(context)=> strings.sell_car;

  @override
  bool hasAppBar(BuildContext context) => false;

  @override
  Widget build(BuildContext context) {
    return mainFrame(
        body: Padding(
      padding: 15.paddingAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (kToolbarHeight).ph,
          Text(
            '1/3',
            style: context.displaySmall,
          ),
          15.ph,
          Text(
            strings.add_car,
            style: context.titleSmall,
          ),
          15.ph,
          Expanded(
            child: buildConsumer(context),
          ),
        ],
      ),
    ));
  }

  PageController controller = PageController();

  @override
  Widget buildWidget(BuildContext context, FirstPageSellCarState state) {
    print('state.data ${state.data}');
    return PageView(
      controller: controller,
      //    physics: NeverScrollableScrollPhysics(),
      children: [
        SellCarFirstScreen(
          state: state,
          onFetchBrandModels: (int brandId) {
            bloc.fetchBrandModels(brandId);
          },
          onFetchBrandModelsExtension: (int modelId) {
            bloc.fetchBrandModelExtensions(modelId);
          },
          onNext: (SellCarParams params) {
          //  bloc.addCar(params);
            controller.nextPage(
                duration: 300.milliseconds, curve: Curves.easeIn);
          },
          onPrevPressed: () {
            controller.previousPage(
                duration: 300.milliseconds, curve: Curves.easeIn);
          },
        ),
        SellCarScreen(shipments: bloc.state.data),
      ],
    );
    return SellCarScreen(shipments: bloc.state.data);
  }
}
