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

import 'package:delala/src/cars/presentation/cars/widgets/custom_square_company_logo.dart';

import '../../../../../core/widgets/buttons/secondary_button.dart';
import '../../../../../core/widgets/icons/icon_text.dart';
import '../../../../main_index.dart';
import '../../cars/widgets/custom_company_container.dart';

class CompanyCarDetailsItem extends BaseStatelessWidget {
  CompanyCarDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCompanyContainer(
          firstOnTap: () {},
          secondOnTap: () {},
          secondButtonLabel: Text(
            strings.request_for_quotation,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.grey_68,
            ),
          ),
          firstRow: Padding(
            padding: 11.paddingHoriz + 8.paddingVert,
            child: Row(
              children: [
                CustomSquareCompanyLogo(logoPath: AppImages.car_name),
                const Spacer(),
                CustomColumn(
                  title: strings.price,
                  value: '850,000',
                ),
                20.pw,
                CustomColumn(
                  title: strings.monthly_installment,
                  value: '5400',
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: 12,
          start: 74,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الحمد للسيارات",
                style: context.textTheme.bodyLarge!.copyWith(
                  color: AppColors.grey_41,
                ),
              ),
              15.ph,
              IconText(
                text: "جدة",
                sizedBoxWidth: 5,
                textStyle: context.textTheme.labelLarge!.copyWith(
                  color: AppColors.grey_68,
                ),
                icon: AppIcons.location_2,
                iconSize: 22,
              )
            ],
          ),
        )
      ],
    );
  }
}

class CustomColumn extends StatelessWidget {
  final String title;
  final String value;

  const CustomColumn({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: context.textTheme.displaySmall!.copyWith(
            color: AppColors.grey_68,
          ),
        ),
        15.ph,
        Text(value),
      ],
    );
  }
}
