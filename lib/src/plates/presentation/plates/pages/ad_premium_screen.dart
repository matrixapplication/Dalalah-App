import 'package:dalalah/core/widgets/icons/icon_text.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/buttons/primary_outlined_buttons.dart';
import '../../../../main_index.dart';
import '../widgets/distinguish_ad.dart';
import '../widgets/packages_list.dart';

class AddPremiumScreen extends BaseStatelessWidget {
  final bool isFilter;

  AddPremiumScreen({Key? key, this.isFilter = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.paddingAll + (kToolbarHeight).paddingTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconText(
            text: strings.your_ad_has_been_published,
            icon: AppImages.done,
            textStyle: context.bodyLarge,
            isIconLift: true,
              mainAxisAlignment: MainAxisAlignment.start,
          ),
          16.ph,
          DistinguishAdWidget(),
          const Expanded(child: PackagesList()),
          PrimaryOutlinesButtons(
            title1: strings.highlight_the_ad,
            title2: strings.watch_my_ad,
            onPrevPressed: () {
              Navigator.pop(context);
            },
            onPressed1: () {
              Navigators.pushNamedAndRemoveUntil(Routes.navigationPages);
            },
          ),
        ],
      ),
    );
  }
}
