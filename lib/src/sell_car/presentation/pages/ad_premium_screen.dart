
import '../../../main_index.dart';
import '../../../plates/domain/entities/ad_feature.dart';
import '../../../plates/domain/entities/ad_types.dart';
import '../../../plates/presentation/plates/widgets/distinguish_ad.dart';
import '../../../plates/presentation/plates/widgets/packages_list.dart';

class AddPremiumScreen extends BaseStatelessWidget {
  final AdFeature adFeature;
  final Function(String)? onSave;

  AddPremiumScreen({Key? key, required this.adFeature, this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPremium = false;
    StreamStateInitial<bool> isPremiumStream = StreamStateInitial<bool>();
    return Padding(
      padding: 16.paddingAll + (kToolbarHeight).paddingTop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IconText(
          //   text: strings.your_ad_has_been_published,
          //   icon: AppImages.done,
          //   textStyle: context.bodyLarge,
          //   isIconLift: true,
          //     mainAxisAlignment: MainAxisAlignment.start,
          // ),
          16.ph,
          DistinguishAdWidget(),
          16.ph,
          PackagesList(
            adFeature: adFeature,
            onChange: (value) {
              isPremium = value;
              isPremiumStream.setData(isPremium);
            },
          ),
          const Spacer(),
          StreamBuilder<bool>(
              initialData: false,
              stream: isPremiumStream.stream,
              builder: (context, snapshot) {
                return PrimaryButton(
                  title: snapshot.data == true
                      ? strings.highlight_the_ad
                      : strings.save,
                  onPressed: () {
                    onSave?.call(isPremium ? AdTypes.featured : AdTypes.basic);
                  },
                );
              }),
        ],
      ),
    );
  }
}
