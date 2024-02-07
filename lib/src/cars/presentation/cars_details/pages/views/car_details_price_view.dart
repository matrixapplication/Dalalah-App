
import '../../../../../../core/utils/helper_methods.dart';
import '../../../../../main_index.dart';
import '../../../../domain/entities/car_details.dart';
import '../../widgets/company_car_details_item.dart';

class CarDetailsPriceView extends BaseStatelessWidget {
  final CarDetails carDetails;
  final Function(int)? onRequestPrice;

  CarDetailsPriceView({super.key, required this.carDetails, this.onRequestPrice});

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
          15.ph,
          FutureBuilder(
              initialData: false,
              future: HelperMethods.isUser(),
              builder: (context, snapshot) {
                bool isUser = snapshot.data as bool;
              return isUser ?
                GestureDetector(
                onTap: () => onRequestPrice?.call(carDetails.car?.id ?? 0),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: 6.paddingVert,
                  decoration: Decorations.kDecorationBorderRadius(
                      color: AppColors.yellow_15,
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(5),
                        bottomEnd: Radius.circular(5),
                      )),
                  child: Text(
                    strings.request_for_quotation,
                    style: context.textTheme.labelLarge!
                        .copyWith(color: Colors.white, fontSize: 17),
                  ),
                ),
              ) : 0.ph;
            }
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
