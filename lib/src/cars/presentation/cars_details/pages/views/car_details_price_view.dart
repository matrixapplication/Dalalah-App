import 'package:dalalah/core/widgets/icons/icon_text.dart';

import '../../../../../../core/widgets/buttons/secondary_button.dart';
import '../../../../../main_index.dart';
import '../../../../domain/entities/car_details.dart';
import '../../widgets/add_rating_widget.dart';
import '../../widgets/company_car_details_item.dart';

class CarDetailsPriceView extends BaseStatelessWidget {
  final CarDetails carDetails;

  CarDetailsPriceView({super.key, required this.carDetails});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 16.paddingHoriz + 20.paddingVert,
      child: Column(
        children: [
          Container(
            padding: 60.paddingHoriz + 8.paddingVert,
            decoration: Decorations.kDecorationOnlyRadius(
              color: context.primaryColor,
            ),
            child: Column(
              children: [
                Text(
                  strings.official_price,
                  style: context.textTheme.labelLarge,
                ),
                8.ph,
                Text(
                  '${carDetails.price ?? ''} ${context.strings.rs}',
                  style: context.textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          23.ph,
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              strings.buy_car_from(
                  "${carDetails.brandModel?.brand} ${carDetails.brandModel?.name}"),
              style: context.textTheme.displayLarge!.copyWith(
                color: AppColors.grey_51,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          15.ph,
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CompanyCarDetailsItem();
            },
          ),
        ],
      ),
    );
  }
}
