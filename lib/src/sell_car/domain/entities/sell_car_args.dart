import '../../../home/domain/entities/car.dart';
import '../../data/models/sell_car_params.dart';

class SellCarArgs {
  Car? car;
  SellCarParams? params;
  bool isEdit = false;

  SellCarArgs({this.car, this.params, this.isEdit = false});
}
