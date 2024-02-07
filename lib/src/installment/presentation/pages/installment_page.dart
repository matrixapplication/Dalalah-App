import '../../../../core/components/base_widget_bloc.dart';
import '../../../../core/utils/navigator.dart';
import '../../../main_index.dart';
import '../bloc/installment_bloc.dart';
import 'installment_screen.dart';

class InstallmentPage extends BaseBlocWidget<UnInitState, InstallmentBloc> {
  InstallmentPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    // bloc.fetchProfileData();
  }

  @override
  String? title(BuildContext context) => strings.installment;



  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return InstallmentScreen(
      installmentValueStream: bloc.installmentValueStream,
      onFetchInstallmentValue: (params) => bloc.fetchInstallmentValue(params),
    );
  }
}
