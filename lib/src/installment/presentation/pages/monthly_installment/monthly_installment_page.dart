
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../../../profile/presentation/bloc/profile_bloc.dart';
import 'monthly_installment_screen.dart';


class MonthlyInstallmentPage extends BaseBlocWidget<UnInitState, ProfileBloc> {
  MonthlyInstallmentPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    // bloc.fetchProfileData();
  }

  @override
  String? title(BuildContext context) => strings.installment;


  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return const MonthlyInstallmentScreen(
      installmentValue: '5000',
      cars: [],
    );
  }
}
