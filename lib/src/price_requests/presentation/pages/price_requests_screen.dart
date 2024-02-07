
import 'package:dalalah/src/cars/presentation/cars/widgets/cars_vertical_item.dart';

import '../../../home/domain/entities/car.dart';
import '../../../main_index.dart';
import '../../domain/entities/request_price.dart';
import '../widgets/price_requests_item.dart';

class PriceRequestsScreen extends BaseStatelessWidget {
  final List<RequestPrice> notifications;
   PriceRequestsScreen({Key? key, required this.notifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: notifications.length,
      padding: 16.paddingAll,
      itemBuilder: (context, index) {
        return CarVerticalItem(
          car: notifications[index].car ?? Car(),
        );
      },
    );
  }
}
