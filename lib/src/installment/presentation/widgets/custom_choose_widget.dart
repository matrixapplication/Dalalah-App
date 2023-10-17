import '../../../main_index.dart';
import 'custom_choose_item_widget.dart';

class CustomChooseWidget extends StatelessWidget {
  const CustomChooseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChooseItemModel> items = [
      ChooseItemModel(
        label: "يوجد",
        value: true,
      ),
      ChooseItemModel(
        label: "لا يوجد",
        value: false,
      ),
    ];

    bool selectedItem = true;
    return StatefulBuilder(
      builder: (context, setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...items.map(
              (item) => Expanded(
                child: CustomChooseItem(
                  chooseItemModel: item,
                  onSelected: (value) {
                    selectedItem = value;
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
  final dynamic value;

  ChooseItemModel({
    required this.label,
    required this.value,
  });
}
