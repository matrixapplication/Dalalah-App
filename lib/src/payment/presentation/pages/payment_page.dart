import '../../../../core/components/base_widget_bloc.dart';
import '../../../main_index.dart';
import '../../domain/entities/package.dart';
import '../bloc/payment_bloc.dart';
import 'payment_screen.dart';

class PaymentPage extends BaseBlocWidget<DataSuccess<List<Package>>, PaymentBloc> {
  PaymentPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchPackages();
  }

  @override
  String? title(BuildContext context) => strings.payment_ways;



  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Package>> state) {
    return PaymentScreen(
      packages: state.data ?? [],
      onFetchInstallmentValue: (package) {
        bloc.makePayment(package);
      },
    );
  }
}
