import 'package:delala/core/widgets/clickable_widget.dart';

import '../../../../../core/widgets/icons/icon_text.dart';
import '../../../../cars/presentation/cars/widgets/custom_company_container.dart';
import '../../../../cars/presentation/cars/widgets/custom_square_company_logo.dart';
import '../../../../main_index.dart';

class ExhibitionItem extends BaseStatelessWidget {
  ExhibitionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClickableWidget(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.exhibitionDetailsPage,
        );
      },
      child: CustomCompanyContainer(
        firstOnTap: () {},
        secondOnTap: () {},
        secondButtonLabel: IconText(
          text: strings.location,
          icon: AppIcons.location_2,
          textColor: AppColors.grey_68,
          fontSize: 16,
          iconSize: 25,
          iconColor: AppColors.blue_49,
          isIconLift: true,
        ),
        firstRow: Padding(
          padding: 10.paddingVert + 15.paddingHoriz,
          child: Row(
            children: [
              CustomSquareCompanyLogo(
                logoPath: AppImages.car_name,
                height: 75,
                width: 83,
                logoAlignment: AlignmentDirectional.center,
              ),
              20.pw,
              Text(
                "الحمد للسيارات",
                style: context.textTheme.bodyLarge!
                    .copyWith(color: AppColors.grey_41),
              )
            ],
          ),
        ),
      ),
    );
  }
}
