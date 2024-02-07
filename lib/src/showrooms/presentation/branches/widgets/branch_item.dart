import '../../../../../core/utils/helper_methods.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/buttons/row_texts_icons_buttons.dart';
import '../../../../../core/widgets/icons/icon_text.dart';
import '../../../../../core/widgets/texts/row_texts.dart';
import '../../../../cars/presentation/cars/widgets/custom_company_container.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/branch.dart';

class BranchItem extends BaseStatelessWidget {
  final Branch branch;
  final bool isEdit;

  BranchItem({super.key, required this.branch, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 20.paddingBottom,
      clipBehavior: Clip.antiAlias,
      decoration:
          Decorations.kDecorationBorder(
              radius: 8,
              borderWidth: 1
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: 12.paddingAll,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  branch.name ?? '',
                  style: context.textTheme.bodyMedium,
                ),
                if (isEdit)
                AppIconButton(
                  icon: AppIcons.edit,
                  size: 20,
                  color: context.primaryColor,
                  onPressed: () {
                    pushNamed(Routes.addBranchPage, arguments: branch);
                  },
                ),
              ],
            ),
          ),
          RowTexts(
            crossAxisAlignment: CrossAxisAlignment.start,
            title: branch.address ?? '',
            value: branch.city ?? '',
            titleStyle: context.textTheme.bodyMedium,
            valueStyle: context.textTheme.displaySmall,
            padding: 12.paddingHoriz,
          ),
          20.ph,
          RowTextsIconsButtons(
            icon1: AppIcons.call,
            icon2: AppIcons.location_2,
            iconColor2: context.primaryColor,
            title1: strings.contact,
            title2: branch.link?.isEmpty ?? true ? strings.not_found_location : strings.location,
            backgroundColor2: context.onSecondaryContainer,
            // centerWidget: centerWidget,
            onPressed1: () {
              HelperMethods.launchCallPhone(branch.phone ?? '');
            },
            onPressed2: branch.link?.isEmpty ?? true ? null : () {
              HelperMethods.launchUrlLink(branch.link ?? '');
            }
          )
        ],
      ),
    );
  }
}
