
import '../../../../../main_index.dart';
import '../../../../domain/entities/car_details.dart';
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
                  '${carDetails.car?.price ?? ''} ${context.strings.rs}',
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
                  "${carDetails.car?.brandModel?.brand} ${carDetails.car?.brandModel?.name}"),
              style: context.textTheme.displayLarge!.copyWith(
                color: AppColors.grey_51,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          15.ph,
          ListView.builder(
            itemCount: carDetails.sameCars?.length ?? 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CompanyCarDetailsItem(
                car: carDetails.sameCars![index],
              );
            },
          ),
        ],
      ),
    );
  }
}
