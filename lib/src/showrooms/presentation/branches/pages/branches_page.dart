import 'package:dalalah/src/installment/domain/entities/roles.dart';
import 'package:dalalah/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../domain/entities/branch.dart';
import '../../../domain/entities/branch_args.dart';
import '../bloc/branches_bloc.dart';
import 'branches_screen.dart';

class BranchesPage extends BaseBlocWidget<DataSuccess<List<Branch>>, BranchesCubit> {
  final int? showroomId;
  BranchesPage({Key? key, this.showroomId}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    BranchArgs? args = getArguments(context);
    int? showroomId = this.showroomId ?? args?.id;
    bloc.fetchBranchesById(showroomId);
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Branch>> state) {
    return BranchesScreen(
      branches: state.data ?? [],
    );
  }

  @override
  String? title(BuildContext context) {
   // int? showroomId = this.showroomId ?? getArguments(context);
    return showroomId != null ? null : strings.branches;
  }

  @override
  onAddButtonPressed() {
    pushNamed(Routes.addBranchPage, arguments: showroomId);
    return null;
  }


  @override
   isAddButton() {
    BranchArgs? args = getArguments(context!);
    print('args?.role: ${args?.role}');
    return args?.role != Roles.USER;
  }

}
