import '../../../src/main_index.dart';
import 'custom_choose_item_widget.dart';

class CustomChooseWidget extends StatelessWidget {
  final List<ChooseItemModel> items;
  final Function(dynamic) onTap;
  final Color? selectedBackgroundColor;
  final Color? unSelectedBackgroundColor;
  final Color? selectedLabelColor;
  final Color? unSelectedLabelColor;
  final double? radius;
  final bool unSelectedHasBorder;
  final bool isIconText;
  final EdgeInsetsDirectional? margin;

  const CustomChooseWidget({
    Key? key,
    required this.items,
    required this.onTap,
    this.selectedBackgroundColor,
    this.unSelectedBackgroundColor,
    this.selectedLabelColor,
    this.unSelectedLabelColor,
    this.radius,
    this.unSelectedHasBorder = false,
    this.margin,
    this.isIconText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic selectedItem = items.first.value;
    return StatefulBuilder(
      builder: (context, setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...items.map(
              (item) => Expanded(
                child: CustomChooseItem(
                  chooseItemModel: item,
                  isIconText: isIconText,
                  selectedBackgroundColor: selectedBackgroundColor,
                  unSelectedBackgroundColor: unSelectedBackgroundColor,
                  selectedLabelColor: selectedLabelColor,
                  unSelectedLabelColor: unSelectedLabelColor,
                  unSelectedHasBorder: unSelectedHasBorder,
                  margin: margin,
                  radius: radius,
                  onSelected: (value) {
                    selectedItem = value;
                    onTap(selectedItem);
                    setState(() {});
                  },
                  selectedItem: selectedItem,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ChooseItemModel {
  final String label;
  final String? icon;
  final Widget? labelWidget;
  final dynamic value;

  ChooseItemModel({
    required this.label,
    required this.value,
    this.labelWidget,
    this.icon,
  });
}
