// import '../../../../../core/widgets/buttons/secondary_button.dart';
// import '../../../../../core/widgets/icons/icon_text.dart';
// import '../../../../main_index.dart';
//
// class CompanyCarDetailsItem extends BaseStatelessWidget {
//   CompanyCarDetailsItem({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: ,
//       margin: const EdgeInsetsDirectional.only(bottom: 20),
//       decoration: Decorations.kDecorationBorder(
//         radius: 8,
//       ),
//       child: Row(
//         children: [
//           Expanded(
//               flex: 1,
//               child: Column(
//                 children: [
//                   Container(
//                     alignment: AlignmentDirectional.centerStart,
//                     height: 90,
//                     width: 90,
//                     decoration: Decorations.kDecorationBorder(
//                       radius: 12,
//                       borderColor: Colors.red,
//                     ),
//                     child: Image.asset(
//                       AppImages.car_name,
//                     ),
//                   ),
//                   SecondaryButton(
//                     borderRadius: const BorderRadiusDirectional.only(
//                       bottomStart: Radius.circular(8),
//                     ),
//                     onPressed: () {},
//                     child: IconText(
//                       text: strings.contact,
//                       icon: AppIcons.call,
//                       textColor: Colors.white,
//                       fontSize: 16,
//                       iconSize: 25,
//                       isIconLift: true,
//                     ),
//                   )
//                 ],
//               )),
//           Expanded(
//             flex: 1,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     CustomColumn(
//                       title: strings.price,
//                       value: '850,000',
//                     ),
//                     CustomColumn(
//                       title: strings.monthly_installment,
//                       value: '5400',
//                     ),
//                   ],
//                 ),
//                 SecondaryButton(
//                   backgroundColor: const Color(0xffF0F0F0),
//                   borderRadius: const BorderRadiusDirectional.only(
//                     bottomEnd: Radius.circular(8),
//                   ),
//                   onPressed: () {},
//                   label: strings.request_for_quotation,
//                   labelColor: AppColors.grey_68,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CustomColumn extends StatelessWidget {
//   final String title;
//   final String value;
//
//   const CustomColumn({
//     super.key,
//     required this.title,
//     required this.value,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 1,
//       child: Column(
//         children: [
//           Text(
//             title,
//             style: context.textTheme.displaySmall!.copyWith(
//               color: AppColors.grey_68,
//             ),
//           ),
//           Text(value),
//         ],
//       ),
//     );
//   }
// }

import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/cars/presentation/cars/widgets/custom_square_company_logo.dart';
import 'package:dalalah/src/cars/presentation/cars_details/widgets/request_for_quotation.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/icons/icon_text.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/same_car.dart';
import '../../cars/widgets/custom_company_container.dart';

class CompanyCarDetailsItem extends BaseStatelessWidget {
  final SameCar? car;
  final Function(int)? onRequestPrice;

  CompanyCarDetailsItem({super.key, this.car, this.onRequestPrice});

  @override
  Widget build(BuildContext context) {
    return CustomCompanyContainer(
      // secondButtonLabel: strings.whatsapp,
      // secondButtonIcon: AppIcons.whatsapp,
      backgroundColor2: context.primaryColor,
      iconColor2: context.cardColor,
      titleStyle2: context.labelMedium,
      firstOnTap: () {
        HelperMethods.launchCallPhone(car?.showroom?.phone ?? '');
      },
      secondOnTap: () {
        pushNamed(
          Routes.branchesPage,
          arguments: car?.showroom?.id ?? 0,
        );
      },
      centerWidget: PrimaryButton(
        title: strings.information,
        height: 20,
        borderRadius: const BorderRadiusDirectional.only(),
        style: context.headlineLarge,
        backgroundColor: context.onSecondaryContainer,
        onPressed: () {
          showDescriptionDetails(context);
        },
      ),
      body: Container(
        padding: 10.paddingHoriz,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: CustomSquareCompanyLogo(
                        logoPath: AppImages.splash_logo)),
                Expanded(
                  flex: 7,
                  //   fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: 5.paddingHoriz,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              car?.showroom?.ownerName ?? '',
                              style: context.textTheme.bodySmall!.copyWith(
                                color: AppColors.grey_41,
                                fontSize: 12,
                              ),
                            ),
                            15.ph,
                            IconText(
                              text: car?.city?.name ?? '',
                              sizedBoxWidth: 5,
                              textStyle: context.textTheme.bodySmall!.copyWith(
                                color: AppColors.grey_68,
                              ),
                              icon: AppIcons.location_2,
                              iconSize: 20,
                            )
                          ],
                        ),
                        const Spacer(),
                        CustomColumn(
                          title: strings.price,
                          value: car?.price ?? '',
                        ),
                        const Spacer(),
                        CustomColumn(
                          title: strings.monthly_installment,
                          value:
                              '${car?.monthlyInstallment ?? ''} ${context.strings.rs}',
                          textColor: AppColors.grey_41,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // RequestForQuotation(
            //   onRequestPrice: () => onRequestPrice?.call(car?.id ?? 0),
            // ),
          ],
        ),
      ),
    );
  }

  showDescriptionDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          scrollable: true,
          title: Text(strings.description,
              style: context.bodySmall.copyWith(fontSize: 16)),
          content: Text(car?.description ?? '',
              style: context.bodySmall.copyWith(fontSize: 12)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(strings.ok),
            ),
          ],
        );
      },
    );
  }
}

class CustomColumn extends StatelessWidget {
  final String title;
  final String value;
  final Color? textColor;

  const CustomColumn({
    super.key,
    required this.title,
    required this.value,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: context.textTheme.displaySmall!.copyWith(
            color: AppColors.grey_68,
            fontSize: 12,
          ),
        ),
        15.ph,
        Text(
          value,
          style: context.headlineSmall.copyWith(
            color: textColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
