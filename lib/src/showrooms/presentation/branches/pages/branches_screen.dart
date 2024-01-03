import 'package:dalalah/src/showrooms/presentation/branches/widgets/branch_item.dart';

import '../../../../main_index.dart';

import '../../../domain/entities/branch.dart';

class BranchesScreen extends BaseStatelessWidget {
  final List<Branch> branches;
  final bool isEdit;
  BranchesScreen({super.key, required this.branches, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: 15.paddingAll,
      itemCount: branches.length,
      itemBuilder: (context, index) {
        return BranchItem(
          branch: branches[index],
          isEdit: isEdit,
        );
      },
    );
  }
}
