import 'package:dalalah/core/widgets/buttons/row_texts_icons_buttons.dart';

import '../../../../main_index.dart';

class CustomCompanyContainer extends BaseStatelessWidget {
  final Function() firstOnTap;
  final Function() secondOnTap;
  final String? secondButtonLabel;
  final Widget body;
  final Decoration? decoration;

  CustomCompanyContainer({
    super.key,
    this.decoration,
    required this.firstOnTap,
    required this.secondOnTap,
     this.secondButtonLabel,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 20.paddingBottom,
      clipBehavior: Clip.antiAlias,
      decoration: decoration ??
          Decorations.kDecorationBorder(
            radius: 8,
            borderWidth: 1
          ),
      child: Column(
        children: [
          body,
          RowTextsIconsButtons(
            icon1: AppIcons.call,
            icon2: AppIcons.location_2,
            title1: strings.contact,
            title2: secondButtonLabel ?? strings.branches,
            onPressed1: firstOnTap,
            onPressed2: secondOnTap,
          )
        ],
      ),
    );
  }
}
