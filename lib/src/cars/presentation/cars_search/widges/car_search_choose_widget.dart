import '../../../../../core/widgets/choose_widget/custom_choose_widget.dart';
import '../../../../main_index.dart';

class CarSearchChooseWidget extends BaseStatelessWidget {
  final List<ChooseItemModel> items;
  final Function(dynamic) onSelect;
  final bool isIconText;

  CarSearchChooseWidget({
    super.key,
    required this.items,
    required this.onSelect,
    this.isIconText = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomChooseWidget(
      radius: 4,
      unSelectedHasBorder: true,
      isIconText: isIconText,
      margin: 15.paddingEnd,
      // unSelectedLabelColor: context.colorScheme.outline,
      unSelectedBackgroundColor: Colors.white,
      items: items,
      onTap: onSelect,
    );
  }
}
