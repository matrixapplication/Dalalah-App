
import 'package:arabitac/core/widgets/drop_down/drop_down.dart';
import 'package:arabitac/core/widgets/text-field/custom_text_field.dart';

import '../../../../core/utils/navigator.dart';
import '../../../../core/widgets/buttons/selection_button_chip.dart';
import '../../../main_index.dart';
import '../../domain/entities/shipment.dart';
import '../widgets/picker_car_images.dart';

class SellCarImagePickerScreen extends BaseStatelessWidget {
  final List<Shipment>? shipments;
  SellCarImagePickerScreen({Key? key, this.shipments}) : super(key: key);
  final List<DropDownItem> items = [
    DropDownItem(
      id: '1',
      title: 'sa'
    ),
  ];
  // properties
  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return AppScaffold(
      bottomNavigationBar: PrimaryButton(
        title: strings.add_car,
        margin: 16.paddingAll,
        onPressed: () {
          Navigators.pushNamedAndRemoveUntil(Routes.navigationPages);
        },
      ),
      body: SingleChildScrollView(
        padding: 16.paddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(strings.maximum_number_images(10), style: context.displaySmall),
            20.ph,
            // Text(strings.add_main_images, style: context.bodyLarge),
            // 10.ph,
            PickerCarImages(),

          ],
        ),
      ),
    );
  }
}
