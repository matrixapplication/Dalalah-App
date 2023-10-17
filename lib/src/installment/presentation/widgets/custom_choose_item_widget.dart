import 'package:delala/core/widgets/clickable_widget.dart';
import 'package:delala/src/installment/presentation/widgets/custom_choose_widget.dart';

import '../../../main_index.dart';

class CustomChooseItem extends BaseStatelessWidget {
  final ChooseItemModel chooseItemModel;
  final dynamic selectedItem;
  final Function(dynamic) onSelected;

  CustomChooseItem({
    super.key,
    required this.chooseItemModel,
    this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ClickableWidget(
      onTap: () => onSelected(chooseItemModel.value),
      child: Container(
        height: 42,
        margin: 20.paddingHoriz,
        alignment: Alignment.center,
        decoration: Decorations.kDecorationOnlyRadius(
          color: selectedItem == chooseItemModel.value
              ? context.primaryColor
              : const Color(0xffD9D9D9),
          radius: 30,
        ),
        child: Text(
          chooseItemModel.label,
          style: context.labelLarge.copyWith(
            // fontSize: 18,
             color: selectedItem == chooseItemModel.value
                  ? Colors.white : AppColors.grey_41,
            height: 1
          ),
        ),
      ),
    );
  }
}
