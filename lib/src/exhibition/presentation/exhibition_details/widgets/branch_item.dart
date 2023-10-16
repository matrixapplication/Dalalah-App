import '../../../../../core/widgets/icons/icon_text.dart';
import '../../../../cars/presentation/cars/widgets/custom_company_container.dart';
import '../../../../main_index.dart';

class BranchItem extends BaseStatelessWidget {
  BranchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCompanyContainer(
      firstOnTap: () {},
      secondOnTap: () {},
      secondButtonHasShadow: false,
      secondButtonColor: Colors.white,
      decoration: Decorations.kDecorationBoxShadow(
        offset: const Offset(0, 4),
        // color: Colors.red,
        colorShadow: const Color(0xffA8A8A8).withOpacity(0.30)
      ),
      secondButtonLabel: IconText(
        text: strings.location,
        icon: AppIcons.location_2,
        textColor: AppColors.grey_68,
        fontSize: 16,
        iconSize: 25,
        iconColor: context.primaryColor,
        isIconLift: true,
      ),
      firstRow: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "الصفا",
                  style: context.textTheme.displayMedium!.copyWith(
                    color: AppColors.grey_41,
                  ),
                ),
                20.ph,
                Text(
                  "ام القرى  - الصفا",
                  style: context.textTheme.displaySmall!.copyWith(
                    color: AppColors.grey_41,
                  ),
                ),
              ],
            ),
            Container(
              padding: 20.paddingHoriz + 6.paddingVert,
              alignment: Alignment.center,
              decoration: Decorations.kDecorationBorderWithRadius(
                borderColor: const Color(0xffC8C8C8),
                radius: 50
              ),
              child: Text(
                "الرياض",
                style: context.textTheme.displaySmall!.copyWith(
                  color: AppColors.grey_41,
                  height: 1
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
