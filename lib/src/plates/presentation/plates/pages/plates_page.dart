
import 'package:delala/core/components/base_widget_bloc.dart';
import 'package:delala/src/home/presentation/widgets/filter_home.dart';

import '../../../../main_index.dart';
import '../../../../sell_car/domain/entities/shipment.dart';
import '../../../domain/entities/plate.dart';
import '../bloc/plates_bloc.dart';
import 'plates_screen.dart';


class PlatesPage extends BaseBlocWidget<DataSuccess<List<Plate>>, PlatesCubit> {
  PlatesPage({Key? key}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFavorites();
  }


  @override
  String? title(context)=> strings.plates;

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: Column(
        children: [
          FilterHome(
            routeName: '',
            onFilterOrder: (){},
          ),
          Expanded(child: buildConsumer(context)),
        ],
      ),
    );
  }


  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Plate>> state) {
    return PlatesScreen(plates: state.data ?? []);
  }

}
