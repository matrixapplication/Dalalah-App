import 'package:dalalah/src/plates/domain/entities/plate.dart';

class PlateArgs {
  bool isEdit;
  bool isFilter;
  Plate? plate;

  PlateArgs({this.isEdit = false, this.isFilter = false, this.plate});
}
