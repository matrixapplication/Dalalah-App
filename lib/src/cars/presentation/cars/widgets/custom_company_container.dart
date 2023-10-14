import '../../../../../core/widgets/buttons/secondary_button.dart';
import '../../../../../core/widgets/icons/icon_text.dart';
import '../../../../main_index.dart';

class CustomCompanyContainer extends BaseStatelessWidget {
  final Function() firstOnTap;
  final Function() secondOnTap;
  final Widget secondButtonLabel;
  final Widget firstRow;

  CustomCompanyContainer({
    super.key,
    required this.firstOnTap,
    required this.secondOnTap,
    required this.secondButtonLabel,
    required this.firstRow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 20),
      decoration: Decorations.kDecorationBorder(
        radius: 8,
      ),
      child: Column(
        children: [
          firstRow,
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SecondaryButton(
                  height: 45,
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(8),
                  ),
                  onPressed: firstOnTap,
                  child: IconText(
                    text: strings.contact,
                    icon: AppIcons.call,
                    textColor: Colors.white,
                    fontSize: 16,
                    iconSize: 25,
                    isIconLift: true,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SecondaryButton(
                  height: 45,
                  backgroundColor: const Color(0xffF0F0F0),
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(8),
                  ),
                  onPressed: secondOnTap,
                  // label: strings.request_for_quotation,
                  // labelColor: AppColors.grey_68,
                  shadowColor: const Color(0xffE9E9E9).withOpacity(0.25),
                  child: secondButtonLabel,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
