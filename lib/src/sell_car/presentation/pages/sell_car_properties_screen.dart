import 'package:delala/core/widgets/drop_down/drop_down.dart';

import '../../../main_index.dart';
import '../../domain/entities/shipment.dart';

class SellCarPropertiesScreen extends BaseStatelessWidget {
  final List<Shipment>? shipments;
  SellCarPropertiesScreen({Key? key, this.shipments}) : super(key: key);
  final List<DropDownItem> items = [
    DropDownItem(
      id: '1',
      title: 'Seat belts'
    ),
    DropDownItem(
        id: '2',
        title: 'Seat belts'
    ),
    DropDownItem(
        id: '3',
        title: 'Seat belts'
    ),
    DropDownItem(
        id: '4',
        title: 'Seat belts'
    ),
  ];
  // properties
  @override
  Widget build(BuildContext context) {
    List<DropDownItem> selected = [];
    final strings = context.strings;
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: 16.paddingAll,
          margin: 16.paddingAll,
          decoration: Decorations.kDecorationRadius(
            color: theme.primaryColor.withOpacity(0.1),
          ),
          child: Text(
            strings.safety,
            style: context.bodyMedium.copyWith(fontSize: 16),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: 10.paddingStart + 3.paddingEnd,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5,
          ),
          itemCount: items!.length,
          itemBuilder: (context, index) {
            return StatefulBuilder(
                builder: (context, setState) {
                  return CheckboxListTile(
                    title: Text(items[index].title ?? '', style: context.bodyMedium,),
                    value: selected.contains(items[index]),
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    onChanged: (value) {
                      setState(() {
                        if(value == true){
                          selected.add(items[index]);
                        }else{
                          selected.remove(items[index]);
                        }
                      });
                    },
                  );
                }
            );
          },
        ),
        Spacer(),
        PrimaryButton(
          title: strings.next,
          margin: 20.paddingAll,
          onPressed: () {
            Navigator.pushNamed(context, Routes.sellCarImagePickerPage);
          },
        ),
      ],
    );
  }
}
