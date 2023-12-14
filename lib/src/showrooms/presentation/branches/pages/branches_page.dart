import 'package:dalalah/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../domain/entities/branch.dart';
import '../bloc/branches_bloc.dart';
import 'branches_screen.dart';

class BranchesPage extends BaseBlocWidget<DataSuccess<List<Branch>>, BranchesCubit> {
  BranchesPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    int id = getArguments(context);
    bloc.fetchBranchesById(id);
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Branch>> state) {
    return BranchesScreen(
      branches: state.data ?? [],
    );
  }

  @override
  String? title(BuildContext context) {
    return strings.branches;
  }

}
