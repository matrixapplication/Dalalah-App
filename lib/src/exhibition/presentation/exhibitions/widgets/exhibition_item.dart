import 'package:delala/core/widgets/images/image_network.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/icons/icon_text.dart';
import '../../../../cars/presentation/cars/widgets/custom_company_container.dart';
import '../../../../main_index.dart';

class ExhibitionItem extends BaseStatelessWidget {
  ExhibitionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigators.pushNamed(
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
          iconColor: context.primaryColor,
          fontSize: 16,
          isIconLift: true,
        ),
        firstRow: Padding(
          padding: 10.paddingVert + 15.paddingHoriz,
          child: Row(
            children: [
              const ImageNetwork(
                image: 'https://play-lh.googleusercontent.com/joJ9c93sLgHTIgkK3Um6vkXKtv4lA9Am3WECHkZCdLAALlzB8CiyUoEE4urjWZbYIA',
                size: 75,
                borderWidth: 1.5,
              ),
              20.pw,
              ColumnTexts(
                crossAxisAlignment: CrossAxisAlignment.start,
                title: "الحمد للسيارات",
                value: "جدة",
                titleStyle: context.textTheme.bodyMedium,
                valueStyle: context.textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
