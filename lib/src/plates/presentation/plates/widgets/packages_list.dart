import 'package:dalalah/core/widgets/texts/row_texts.dart';

import '../../../../main_index.dart';
import '../../../domain/entities/ad_feature.dart';

class PackagesList extends StatelessWidget {
  final AdFeature adFeature;
  final bool isFromMyAds;
  final Function(bool)? onChange;

  const PackagesList({super.key, required this.adFeature, this.onChange, this.isFromMyAds = false});

  @override
  Widget build(BuildContext context) {
    bool isPremium = isFromMyAds;
    return Container(
      padding: 12.paddingAll,
      margin: 12.paddingBottom,
      decoration: Decorations.kDecorationBorder(
        radius: 12,
      ),
      child: Row(
        children: [
          StatefulBuilder(
              builder: (context, setState) {
                return Checkbox(
                  value: isPremium,
                  onChanged: (value) {
                    if (isFromMyAds) return;
                    isPremium = !isPremium;
                    onChange?.call(isPremium);
                    setState(() {});
                  },
                  activeColor: context.primaryColor,
                  visualDensity: const VisualDensity(horizontal: -4),
                );
              }
          ),
          10.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RowTexts(
                  title: context.strings.premium,
                  value: '${adFeature.featureDurationPrice} ${context.strings.rs}',
                  titleStyle: context.bodyMedium,
                  valueStyle: context.headlineMedium,
                ),
                20.ph,
                Text(context.strings.premium_description(adFeature.featureDuration),
                    style: context.bodyMedium.copyWith(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
