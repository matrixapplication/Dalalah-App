import 'package:dalalah/core/widgets/drop_down/drop_down.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';
import '../../../../core/themes/light_theme.dart';
import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../main_index.dart';
import '../../domain/entities/shipment.dart';

class SellCarScreen extends BaseStatelessWidget {
  final List<Shipment>? shipments;

  SellCarScreen({Key? key, this.shipments}) : super(key: key);
  final List<DropDownItem> items = [
    const DropDownItem(id: '1', title: 'sa', value: 'val'),
  ];

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return SingleChildScrollView(
      padding: 15.paddingAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          25.ph,
          SelectionButtonChip(
            title: strings.car_status,
            types: [
              ChipItem(title: strings.new_),
              ChipItem(title: strings.used),
            ],
            onSelected: (value) {},
          ),
          24.ph,
          DropDownField(
            title: strings.car_type,
            hint: strings.select_badge_type,
            items: items,
            height: 55,
            onChanged: (value) {},
          ),
          24.ph,
          DropDownField(
            title: strings.car_model,
            hint: strings.select_car_model,
            items: items,
            height: 55,
            onChanged: (value) {},
          ),
          24.ph,
          DropDownField(
            title: strings.year_car_production,
            hint: strings.select_year,
            items: items,
            height: 55,
            onChanged: (value) {},
          ),
          20.ph,
          SelectionButtonChip(
            title: strings.type_vehicle_transmission_engine,
            types: [
              ChipItem(
                icon: 'https://cdn-icons-png.flaticon.com/512/6471/6471695.png',
                title: strings.automatic,
              ),
              ChipItem(
                icon: 'https://i.stack.imgur.com/tWFGc.png',
                title: strings.manual,
              ),
            ],
            onSelected: (value) {},
          ),
          24.ph,
          DropDownField(
            title: strings.external_car_shape,
            hint: strings.select_shape,
            items: items,
            onChanged: (value) {},
            height: 55,
          ),
          24.ph,
          DropDownField(
            title: strings.external_car_shape_status,
            hint: strings.select_status,
            items: items,
            onChanged: (value) {},
            height: 55,
          ),
          24.ph,
          SelectionButtonChip(
            title: strings.fuel_type,
            types: [
              ChipItem(
                title: strings.banzene,
                icon: AppIcons.fuel,
              ),
              ChipItem(
                icon: AppIcons.fuel,
                title: strings.dizel,
              ),
              ChipItem(
                icon: AppIcons.fuel,
                title: strings.natural_gas,
              ),
              ChipItem(
                icon: AppIcons.fuel,
                title: strings.electricity,
              ),
            ],
            onSelected: (value) {},
          ),
          24.ph,
          DropDownField(
            title: strings.number_car_cylinders,
            hint: strings.number_car_cylinders,
            items: items,
            onChanged: (value) {},
            height: 55,
          ),
          15.ph,
          CustomTextField(
            title: strings.number_kilometers_km,
            hintText: strings.number_kilometers_km,
            contentPadding: 16.paddingHoriz + 17.paddingVert,
            maxHeight: 62,
            radius: 8,
          ),
          10.ph,
          DropDownField(
            title: strings.car_color,
            hint: strings.select_color,
            items: items,
            height: 55,
            onChanged: (value) {},
          ),
          24.ph,
          PrimaryOutlinesButtons(
            title1: strings.next,
            title2: strings.cancel,
            onPrevPressed: () {
              Navigator.pop(context);
            },
            onPressed1: () {
              Navigators.pushNamed(Routes.sellCarPropertiesPage);
            },
          ),
          6.ph,
        ],
      ),
    );
  }
}
