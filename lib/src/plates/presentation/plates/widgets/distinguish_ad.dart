import '../../../../main_index.dart';

class DistinguishAdWidget extends BaseStatelessWidget {
  DistinguishAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 20.paddingAll,
      decoration: Decorations.kDecorationOnlyRadius(
        color: context.primaryColor,
        radius: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              strings.distinguish_your_ad_get_higher_reach,
              style: context.labelMedium,
            ),
          ),
          Image.asset(
            AppImages.rocket,
            width: 60,
            height: 60,
          ),
        ],
      ),
    );
  }
}
