
import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/sell_car/presentation/pages/sell_car_properties_screen.dart';

import '../../../../core/utils/navigator.dart';
import '../../../main_index.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/entities/feature.dart';
import '../bloc/sell_car_properites_bloc.dart';
import '../widgets/header_sell_car.dart';


class SellCarPropertiesPage extends BaseBlocWidget<DataSuccess<List<Feature>>, SellCarPropertiesCubit> {
  final List<Feature>? initialFeatures;
  final Function(List<int>)? onNext;
  SellCarPropertiesPage({Key? key, this.initialFeatures, this.onNext}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFeatures();
  }


  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: HeaderSellCar(
        step: 3,
        buildConsumer: buildConsumer(context),
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Feature>> state) {
    final args = getArguments(context);
    return SellCarPropertiesScreen(
      features: state.data ?? [],
      initialFeatures: initialFeatures,
      onNextPressed: (selected) {
        SellCarParams params = args;
        params.features = selected.map((e) => e.toString()).toList();
        Navigators.pushNamed(Routes.sellCarImagePickerPage, arguments: params);
      },
    );
  }

}
