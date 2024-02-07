
import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/plates/presentation/add_plate/pages/plate_filter_screen.dart';
import 'package:dalalah/src/sell_car/domain/entities/city.dart';
import 'package:dalalah/src/settings/support/pages/support_screen.dart';

import '../../../../core/utils/navigator.dart';
import '../../../main_index.dart';
import '../../domain/entities/contact_us.dart';
import '../bloc/support_bloc.dart';


class SupportPage extends BaseBlocWidget<DataSuccess<ContactUs>, SupportCubit> {
  SupportPage({Key? key}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCities();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<ContactUs> state) {
    return SupportScreen(
      contactUs: state.data!,
      onContactUs: (params) {
        bloc.addSupport(params);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    pushNamed(Routes.navigationPages);
  }

  @override
  String? title(BuildContext context) {
    return strings.help_support;
  }

}
