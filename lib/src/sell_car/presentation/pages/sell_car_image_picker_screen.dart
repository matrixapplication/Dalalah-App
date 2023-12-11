import 'package:dalalah/core/widgets/drop_down/drop_down.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';

import '../../../../core/themes/light_theme.dart';
import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../main_index.dart';
import '../../domain/entities/shipment.dart';
import '../widgets/picker_car_images.dart';

class SellCarImagePickerScreen extends BaseStatelessWidget {
  final List<Shipment>? shipments;

  SellCarImagePickerScreen({Key? key, this.shipments}) : super(key: key);
  final List<DropDownItem> items = [
    DropDownItem(id: '1', title: 'sa'),
  ];

  // properties
  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return SingleChildScrollView(
      padding: 16.paddingAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          40.ph,
          Text(
            '3/3',
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
          CustomTextField(
            title: strings.car_price,
            hintText: strings.enter_car_price,
            keyboardType: TextInputType.number,
          ),
          10.ph,
          CustomTextField(
            title: strings.installment_value_monthly,
            hintText: strings.enter_installment_value,
          ),
          10.ph,
          CustomTextField(
            title: strings.car_description,
            hintText: strings.enter_car_description,
            keyboardType: TextInputType.number,
          ),
          15.ph,
          PickerCarImages(),
          30.ph,
          PrimaryOutlinesButtons(
            title1: strings.share,
            title2: strings.back,
            onPrevPressed: () {
              Navigator.pop(context);
            },
            onPressed1: () {
              Navigators.pushNamed(Routes.addPremiumPage);
            },
          ),
        ],
      ),
    );

    // return AppScaffold(
    //   bottomNavigationBar: PrimaryButton(
    //     title: strings.add_car,
    //     margin: 16.paddingAll,
    //     onPressed: () {
    //       Navigators.pushNamedAndRemoveUntil(Routes.navigationPages);
    //     },
    //   ),
    //   body: SingleChildScrollView(
    //     padding: 16.paddingAll,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(strings.maximum_number_images(10), style: context.displaySmall),
    //         20.ph,
    //         // Text(strings.add_main_images, style: context.bodyLarge),
    //         // 10.ph,
    //         PickerCarImages(),
    //
    //       ],
    //     ),
    //   ),
    // );
  }
}
