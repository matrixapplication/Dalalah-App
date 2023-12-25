import '../../../../../core/utils/helper_methods.dart';
import '../../../../../core/widgets/icons/icon_text.dart';
import '../../../../cars/presentation/cars/widgets/custom_company_container.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/branch.dart';

class BranchItem extends BaseStatelessWidget {
  final Branch branch;

  BranchItem({super.key, required this.branch});

  @override
  Widget build(BuildContext context) {
    return CustomCompanyContainer(
      firstOnTap: () {
        HelperMethods.launchCallPhone(branch.phone ?? '');
        },
      secondOnTap: () {
        HelperMethods.launchUrlLink(branch.link ?? '');
      },
      secondButtonLabel: strings.location,
      decoration: Decorations.kDecorationBoxShadow(
          offset: const Offset(0, 4),
          colorShadow: const Color(0xffA8A8A8).withOpacity(0.30)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ColumnTexts(
              crossAxisAlignment: CrossAxisAlignment.start,
              title: branch.name ?? '',
              value: branch.address ?? '',
              titleStyle: context.textTheme.bodyMedium,
              valueStyle: context.textTheme.displaySmall,
            ),
            Container(
              padding: 20.paddingHoriz + 6.paddingVert,
              alignment: Alignment.center,
              decoration: Decorations.kDecorationBorderWithRadius(
                  borderColor: const Color(0xffC8C8C8), radius: 50),
              child: Text(
                branch.city ?? '',
                style: context.textTheme.displaySmall!
                    .copyWith(color: AppColors.grey_41, height: 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
