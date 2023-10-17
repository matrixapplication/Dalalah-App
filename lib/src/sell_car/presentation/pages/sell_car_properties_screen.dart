import '../../../../core/themes/light_theme.dart';
import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../cars/presentation/cars_details/widgets/car_properties.dart';
import '../../../main_index.dart';
import '../../domain/entities/shipment.dart';

class SellCarPropertiesScreen extends BaseStatelessWidget {
  final List<Shipment>? shipments;

  SellCarPropertiesScreen({Key? key, this.shipments}) : super(key: key);

  // final List<DropDownItem> items = [
  //   DropDownItem(
  //     id: '1',
  //     title: 'Seat belts'
  //   ),
  //   DropDownItem(
  //       id: '2',
  //       title: 'Seat belts'
  //   ),
  //   DropDownItem(
  //       id: '3',
  //       title: 'Seat belts'
  //   ),
  //   DropDownItem(
  //       id: '4',
  //       title: 'Seat belts'
  //   ),
  // ];
  // properties
  @override
  Widget build(BuildContext context) {
    // List<DropDownItem> selected = [];
    List<Widget> properties = [
      CarPropertyItem(
        height: 85,
        width: 85,
        radius: 16,
        textStyle: context.displaySmall.copyWith(fontSize: 12),
        // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
        padding: 10.paddingAll,
        property: CarProperty(
          title: "سعة المحرك",
          icon: AppIcons.timer,
        ),
      ),
      CarPropertyItem(
        height: 85,
        width: 85,
        radius: 16,
        textStyle: context.displaySmall.copyWith(fontSize: 12),
        // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
        padding: 10.paddingAll,
        property: CarProperty(
          title: "سعة المحرك",
          icon: AppIcons.timer,
        ),
      ),
      CarPropertyItem(
        height: 85,
        width: 85,
        radius: 16,
        textStyle: context.displaySmall.copyWith(fontSize: 12),
        // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
        padding: 10.paddingAll,
        property: CarProperty(
          title: "سعة المحرك",
          icon: AppIcons.timer,
        ),
      ),
      CarPropertyItem(
        height: 85,
        width: 85,
        radius: 16,
        textStyle: context.displaySmall.copyWith(fontSize: 12),
        // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
        padding: 10.paddingAll,
        property: CarProperty(
          title: "سعة المحرك",
          icon: AppIcons.timer,
        ),
      ),
      CarPropertyItem(
        height: 85,
        width: 85,
        radius: 16,
        textStyle: context.displaySmall.copyWith(fontSize: 12),
        // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
        padding: 10.paddingAll,
        property: CarProperty(
          title: "سعة المحرك",
          icon: AppIcons.timer,
        ),
      ),
      CarPropertyItem(
        height: 85,
        width: 85,
        radius: 16,
        textStyle: context.displaySmall.copyWith(fontSize: 12),
        // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
        padding: 10.paddingAll,
        property: CarProperty(
          title: "سعة المحرك",
          icon: AppIcons.timer,
        ),
      ),
      CarPropertyItem(
        height: 85,
        width: 85,
        radius: 16,
        textStyle: context.displaySmall.copyWith(fontSize: 12),
        // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
        padding: 10.paddingAll,
        property: CarProperty(
          title: "سعة المحرك",
          icon: AppIcons.timer,
        ),
      ),
      CarPropertyItem(
        height: 85,
        width: 85,
        radius: 16,
        textStyle: context.displaySmall.copyWith(fontSize: 12),
        // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
        padding: 10.paddingAll,
        property: CarProperty(
          title: "سعة المحرك",
          icon: AppIcons.timer,
        ),
      ),
      CarPropertyItem(
        height: 85,
        width: 85,
        radius: 16,
        textStyle: context.displaySmall.copyWith(fontSize: 12),
        // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
        padding: 10.paddingAll,
        property: CarProperty(
          title: "سعة المحرك",
          icon: AppIcons.timer,
        ),
      ),
      CarPropertyItem(
        height: 85,
        width: 85,
        radius: 16,
        textStyle: context.displaySmall.copyWith(fontSize: 12),
        // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
        padding: 10.paddingAll,
        property: CarProperty(
          title: "سعة المحرك",
          icon: AppIcons.timer,
        ),
      ),
      CarPropertyItem(
        height: 85,
        width: 85,
        radius: 16,
        textStyle: context.displaySmall.copyWith(fontSize: 12),
        // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
        padding: 10.paddingAll,
        property: CarProperty(
          title: "سعة المحرك",
          icon: AppIcons.timer,
        ),
      ),
      CarPropertyItem(
        height: 85,
        width: 85,
        radius: 16,
        textStyle: context.displaySmall.copyWith(fontSize: 12),
        // mainAxisAlignment : MainAxisAlignment.spaceEvenly,
        padding: 10.paddingAll,
        property: CarProperty(
          title: "سعة المحرك",
          icon: AppIcons.timer,
        ),
      ),
    ];
    final strings = context.strings;
    return SingleChildScrollView(
      padding: 15.paddingAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.ph,
          Text(
            '2/3',
            style: context.displayMedium.copyWith(
              fontFamily: fontRegular,
              fontWeight: FontWeight.w400,
            ),
          ),
          15.ph,
          Text(
            strings.add_car,
            style: context.titleSmall,
          ),
          25.ph,
          Text(
            strings.add_car_features,
            style: context.bodyMedium,
          ),
          20.ph,
          Wrap(
            children: properties,
          ),
          100.ph,
          PrimaryOutlinesButtons(
            title1: strings.next,
            title2: strings.back,
            onPressed2: () {
              Navigator.pop(context);
            },
            onPressed1: () {
              Navigators.pushNamed(Routes.sellCarImagePickerPage);
            },
          ),
        ],
      ),
    );
  }
}

// GridView.builder(
//   shrinkWrap: true,
//   padding: 10.paddingStart + 3.paddingEnd,
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//     childAspectRatio: 5,
//   ),
//   itemCount: items!.length,
//   itemBuilder: (context, index) {
//     return StatefulBuilder(
//         builder: (context, setState) {
//           return CheckboxListTile(
//             title: Text(items[index].title ?? '', style: context.bodyMedium,),
//             value: selected.contains(items[index]),
//             visualDensity: VisualDensity(horizontal: -4, vertical: -4),
//             onChanged: (value) {
//               setState(() {
//                 if(value == true){
//                   selected.add(items[index]);
//                 }else{
//                   selected.remove(items[index]);
//                 }
//               });
//             },
//           );
//         }
//     );
//   },
// ),
// Spacer(),
