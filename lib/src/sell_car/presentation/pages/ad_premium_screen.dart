
import 'package:dalalah/core/widgets/scaffold/back_button_icon.dart';
import 'package:dalalah/core/widgets/snack_bar/snack_bar_manager.dart';

import '../../../../core/widgets/icons/icon_text.dart';
import '../../../main_index.dart';
import '../../../plates/domain/entities/ad_feature.dart';
import '../../../plates/domain/entities/ad_types.dart';
import '../../../plates/presentation/plates/widgets/distinguish_ad.dart';
import '../../../plates/presentation/plates/widgets/packages_list.dart';

class AddPremiumScreen extends BaseStatelessWidget {
  final AdFeature? adFeature;
  final bool isDisableSaveButton;
  final Function(String)? onSave;

  AddPremiumScreen({Key? key, required this.adFeature, this.onSave, this.isDisableSaveButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPremium = false;
    StreamStateInitial<bool> isPremiumStream = StreamStateInitial<bool>();
    return Padding(
      padding: 16.paddingAll + (kToolbarHeight).paddingTop,
      child: Column(
        crossAxisAlignment: adFeature == null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          const Align(
              alignment: AlignmentDirectional.centerStart,
              child: CustomBackButton()),
          if(adFeature == null)
          ...[
            Image.asset(AppImages.done, height: 100, width: 100),
          Text(
            strings.your_ad_has_been_published,
             style: headlineLarge.copyWith(fontSize: 30),
            textAlign: TextAlign.center,
          )] else
         ...[ 16.ph,
          DistinguishAdWidget(),
          16.ph,
          PackagesList(
            adFeature: adFeature ?? AdFeature(),
            onChange: (value) {
              isPremium = value;
              isPremiumStream.setData(isPremium);
            },
          ),],
          const Spacer(),
          StreamBuilder<bool>(
              initialData: false,
              stream: isPremiumStream.stream,
              builder: (context, snapshot) {
                return PrimaryButton(
                  title: snapshot.data == true
                      ? strings.highlight_the_ad
                      : strings.save,
                  onPressed: //(snapshot.data == false && isDisableSaveButton) ? null :
                      () {
                    if (adFeature?.featureDurationPrice == '0') {
                      SnackBarManager.showErrorSnackBar(strings.feature_duration_price_zero_msg);
                    } else {
                      onSave?.call(isPremium ? AdTypes.featured : AdTypes.basic);
                    }
                  },
                );
              }),
        ],
      ),
    );
  }
}
