

import 'package:dalalah/src/main_index.dart';

import '../../../../core/widgets/buttons/selection_button_chip.dart';

class PlateTypes {
  static const String private = 'private';
  static const String transfer = 'transfer';

  static  List<ChipItem> getTypes() {
    final strings = injector<ServicesLocator>().strings;
    return
    [
      ChipItem(title: strings.plate_private, id: PlateTypes.private),
      ChipItem(title: strings.plate_transfer, id: PlateTypes.transfer)
    ];
  }
}

