
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/widgets/pagination/pagination_widget.dart';
import '../../../../cars/presentation/cars/pages/cars_screen.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../main_index.dart';
import '../../bloc/installment_bloc.dart';
import '../../widgets/installment_value.dart';


class MonthlyInstallmentPage extends BaseBlocWidget<DataSuccess<List<Car>>, InstallmentBloc> {
  MonthlyInstallmentPage({Key? key}) : super(key: key);

  int installmentValue = 0;
  @override
  void loadInitialData(BuildContext context) {
    installmentValue = getArguments(context) ?? 0;
    bloc.filterCarsByInstallment(installmentValue);
  }

  @override
  String? title(BuildContext context) => strings.installment;

  @override
  Widget build(BuildContext context) {
    int installmentValue = getArguments(context) ?? 0;

    return mainFrame(
      body: Column(
        children: [
          InstallmentValue(installmentValue: installmentValue.toString(),
            padding: 20.paddingAll,
          ),
          10.ph,
          Expanded(child: buildConsumer(context)),
        ],
      )
    );
    // return 0.ph;
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Car>> state) {
    return PaginationWidget(
      refreshController: bloc.refreshController,
      onRefresh: () {
        bloc.filterCarsByInstallment(installmentValue);
      },
      onLoading: () async {
        await bloc.filterCarsByInstallment(installmentValue, isRefresh: false);
        // await Future.delayed(const Duration(milliseconds: 1200));
      },
      child: CarsScreen(
        cars: state.data ?? [],
      ),
    );
    // return 0.ph;
  }
}
