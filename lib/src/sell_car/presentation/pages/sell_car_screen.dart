
import 'package:arabitac/core/widgets/drop_down/drop_down.dart';
import 'package:arabitac/core/widgets/text-field/custom_text_field.dart';

import '../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../main_index.dart';
import '../../domain/entities/shipment.dart';

class SellCarScreen extends BaseStatelessWidget {
  final List<Shipment>? shipments;
  SellCarScreen({Key? key, this.shipments}) : super(key: key);
  final List<DropDownItem> items = [
    DropDownItem(
      id: '1',
      title: 'sa'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return SingleChildScrollView(
      padding: 16.paddingHoriz,
      child: Column(
        children: [
          DropDownField(
            title: strings.select_badge_type,
            hint: strings.select_badge_type,
            items: items,
            onChanged: (value){

            },
          ),
          DropDownField(
            title: strings.select_car_model,
            hint: strings.select_car_model,
            items: items,
            onChanged: (value){

            },
          ),
          DropDownField(
            title: strings.extend_car_model,
            hint: strings.extend_car_model,
            items: items,
            onChanged: (value){

            },
          ),
          DropDownField(
            title: strings.year_car_production,
            hint: strings.year_car_production,
            items: items,
            onChanged: (value){

            },
          ),
          20.ph,
          SelectionButtonChip(
            title: strings.type_vehicle_transmission_engine,
            types: [
              ChipItem(
                  icon: 'https://cdn-icons-png.flaticon.com/512/6471/6471695.png',
                  title: 'Automatic'),
              ChipItem(
                  icon: 'https://i.stack.imgur.com/tWFGc.png',
                  title: 'Manual',),
            ],
            onSelected: (value) {},
          ),

          DropDownField(
            title: strings.car_shape,
            hint: strings.year_car_production,
            items: items,
            onChanged: (value){

            },
          ),

          DropDownField(
            title: strings.fuel_type,
            hint: strings.year_car_production,
            items: items,
            onChanged: (value){

            },
          ),
          CustomTextField(
            labelText: strings.number_car_cylinders,
            hintText: strings.number_car_cylinders,
          ),
          CustomTextField(
            labelText: strings.number_kilometers_km,
            hintText: strings.number_kilometers_km,
          ),

          DropDownField(
            title: strings.car_color,
            hint: strings.car_color,
            items: items,
            onChanged: (value){

            },
          ),
          CustomTextField(
            labelText: strings.price_egp,
            hintText: strings.price_egp,
          ),
          CustomTextField(
            labelText: strings.car_description,
            hintText: strings.car_description,
          ),
          PrimaryButton(
            title: strings.next,
            margin: 20.paddingVert,
            onPressed: () {
              Navigator.pushNamed(context, Routes.sellCarPropertiesPage);
            },
          ),
        ],
      ),
    );
  }
}
