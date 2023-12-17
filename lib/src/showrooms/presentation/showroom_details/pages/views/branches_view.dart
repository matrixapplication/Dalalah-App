import '../../../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../../main_index.dart';
import '../../../../domain/entities/branch.dart';
import '../../../branches/widgets/branch_item.dart';

class BranchesView extends BaseStatelessWidget {
  BranchesView({super.key});

  @override
  Widget build(BuildContext context) {

    List<DropDownItem> items = const [
      DropDownItem(
        title: "الرياض",
        value: "الرياض",
      ),
      DropDownItem(
        title: "مصر",
        value: "مصر",
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          10.ph,
          DropDownField(
            margin: 230.paddingEnd + 20.paddingStart,
            valueId: items.first,
            items: items,
            iconWidget: AppIcon(
              icon: AppIcons.down_arrow,
            ),
          ),
          5.ph,
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            padding: 15.paddingAll,
            itemBuilder: (context, index) {
              return BranchItem(branch: Branch(),);
            },
          ),
        ],
      ),
    );
  }
}
