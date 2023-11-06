import 'package:dalalah/core/components/base_widget_bloc.dart';

import '../../../../main_index.dart';
import '../../../domain/entities/plate.dart';
import '../bloc/plates_bloc.dart';
import 'ad_premium_screen.dart';

class AddPremiumPage
    extends BaseBlocWidget<DataSuccess<List<Plate>>, PlatesCubit> {
  final bool isFilter;

  AddPremiumPage({Key? key, this.isFilter = true}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFavorites();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Plate>> state) {
    return AddPremiumScreen();
  }
}
