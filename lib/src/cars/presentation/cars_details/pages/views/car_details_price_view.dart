import 'package:delala/core/widgets/icons/icon_text.dart';

import '../../../../../../core/widgets/buttons/secondary_button.dart';
import '../../../../../main_index.dart';
import '../../widgets/company_car_details_item.dart';

class CarDetailsPriceView extends BaseStatelessWidget {
  CarDetailsPriceView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 20.paddingHoriz + 20.paddingVert,
      child: Column(
        children: [
          Container(
            padding: 60.paddingHoriz + 8.paddingVert,
            decoration: Decorations.kDecorationOnlyRadius(
              color: AppColors.blue_49,
            ),
            child: Column(
              children: [
                Text(
                  strings.official_price,
                  style: context.textTheme.labelLarge,
                ),
                8.ph,
                Text(
                  '800,000 ${context.strings.rs}',
                  style: context.textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          25.ph,
          Row(
            children: [
              Text(
                strings.monthly_installment,
                style: context.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 15
                ),
              ),
              15.pw,
              Text(
                '500 ${context.strings.rs}',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.blue_49,
                ),
              ),
            ],
          ),
          23.ph,
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              strings.buy_car_from('بي ام دبليو  X6 218i X6 218i '),
              style: context.textTheme.displayLarge!.copyWith(
                color: AppColors.grey_51,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          15.ph,
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CompanyCarDetailsItem(),
              CompanyCarDetailsItem(),
              CompanyCarDetailsItem(),
            ],
          )

        ],
      ),
    );
  }
}
