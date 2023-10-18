import 'package:delala/core/widgets/clickable_widget.dart';
import '../../../src/main_index.dart';
import '../icons/icon_text.dart';
import 'custom_choose_widget.dart';

class CustomChooseItem extends BaseStatelessWidget {
  final ChooseItemModel chooseItemModel;
  final dynamic selectedItem;
  final Function(dynamic) onSelected;
  final Color? selectedBackgroundColor;
  final Color? unSelectedBackgroundColor;
  final Color? selectedLabelColor;
  final Color? unSelectedLabelColor;
  final double? radius;
  final bool unSelectedHasBorder;
  final bool isIconText;
  final EdgeInsetsDirectional? margin;

  CustomChooseItem({
    super.key,
    required this.chooseItemModel,
    this.selectedItem,
    this.margin,
    required this.onSelected,
    this.selectedBackgroundColor,
    this.unSelectedBackgroundColor,
    this.selectedLabelColor,
    this.unSelectedLabelColor,
    this.radius,
    this.unSelectedHasBorder = false,
    this.isIconText = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClickableWidget(
      onTap: () => onSelected(chooseItemModel.value),
      child: Container(
        height: 42,
        margin: margin ?? 20.paddingHoriz,
        alignment: Alignment.center,
        decoration: Decorations.kDecorationBorder(
          backgroundColor: selectedItem == chooseItemModel.value
              ? selectedBackgroundColor ?? context.primaryColor
              : unSelectedBackgroundColor ?? const Color(0xffD9D9D9),
          radius: radius ?? 30,
          borderColor: unSelectedHasBorder
              ? selectedItem == chooseItemModel.value
                  ? Colors.white
                  : null
              : Colors.white,
        ),
        child: isIconText
            ? IconText(
                text: chooseItemModel.label,
                icon: chooseItemModel.icon,
                textColor: selectedItem == chooseItemModel.value
                    ? Colors.white
                    : kGreyColor,
                iconColor: selectedItem == chooseItemModel.value
                    ? Colors.white
                    : kGreyColor,
              )
            : Text(
                chooseItemModel.label,
                style: context.labelLarge.copyWith(
                  // fontSize: 18,
                  color: selectedItem == chooseItemModel.value
                      ? selectedLabelColor ?? Colors.white
                      : unSelectedLabelColor ?? kGreyColor,
                  height: 1,
                ),
              ),
      ),
    );
  }
}
