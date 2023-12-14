import 'package:dalalah/core/widgets/texts/row_texts.dart';
import '../../../../../home/domain/entities/car.dart';
import '../../../../../main_index.dart';
import '../../../cars/widgets/cars_vertical_item.dart';

class CarDetailsCategoryView extends BaseStatelessWidget {
  CarDetailsCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return CarVerticalItem(isCatItem: true,
      car: Car());
    // return SingleChildScrollView(
    //   padding: 16.paddingHoriz + 10.paddingVert,
    //   child: Column(
    //     children: [
    //       const ,
    //       Container(
    //         padding: 15.paddingAll,
    //         decoration: Decorations.kDecorationOnlyRadius(
    //           color: AppColors.grey_d9,
    //           radius: 0,
    //         ),
    //         child: Column(
    //           children: [
    //             CategoryRowText(
    //               title: 'ADVANTAGE',
    //               value: '1000,000',
    //               textColor: AppColors.blue_49.withOpacity(0.3),
    //             ),
    //             CategoryRowText(
    //               title: 'Sport Line',
    //               value: '1200,000',
    //             ),
    //             CategoryRowText(
    //               title: 'M Sport',
    //               value: '1500,000',
    //               isLastItem: true,
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}

class CategoryRowText extends StatelessWidget {
  final String title;
  final String value;
  final Color? textColor;
  final bool isLastItem;

  const CategoryRowText({
    super.key,
    required this.title,
    required this.value,
    this.textColor,
    this.isLastItem = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowTexts(
          title: title,
          titleStyle: context.headlineMedium.copyWith(
            color: textColor,
            decoration: TextDecoration.underline,
          ),
          value: value,
          valueStyle: context.headlineMedium.copyWith(
            color: textColor
          ),
          valuePadding: 30.paddingEnd,
        ),
        isLastItem
            ? 0.ph
            : const Divider(
                height: 20,
                thickness: 1,
                color: Color(0xffC1C1C1),
              )
      ],
    );
  }
}
