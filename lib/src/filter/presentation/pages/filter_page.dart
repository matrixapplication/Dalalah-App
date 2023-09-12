
import '../../../../core/components/base_widget_bloc.dart';
import '../../../main_index.dart';
import '../../domain/entities/invoice.dart';
import '../bloc/filter_bloc.dart';
import 'filter_screen.dart';

// ignore: must_be_immutable
class FilterPage extends BaseBlocWidget<UnInitState, FilterCubit> {
  FilterPage({Key? key}) : super(key: key);


  // @override
  // void loadInitialData(BuildContext context) {
  //   bloc.fetchInvoices();
  // }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return FilterScreen(
      invoices: state.data ?? [],
      onSearch: (value) {},
    );
  }

  @override
  String? title(BuildContext context) {
    return strings.filter;
  }
}
