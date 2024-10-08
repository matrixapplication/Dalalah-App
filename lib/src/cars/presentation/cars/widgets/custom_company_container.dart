import 'package:dalalah/core/widgets/buttons/row_texts_icons_buttons.dart';

import '../../../../main_index.dart';

class CustomCompanyContainer extends BaseStatelessWidget {
  final Function() firstOnTap;
  final Function() secondOnTap;
  final String? secondButtonLabel;
  final String? secondButtonIcon;
  final Color? iconColor2;
  final Color? backgroundColor2;
  final Widget body;
  final Decoration? decoration;
  final Widget? centerWidget;
  final TextStyle? titleStyle2;
  final double? height;
  final bool? hasOneButton;

  CustomCompanyContainer( {
    super.key,
    this.decoration,
    this.hasOneButton,
    required this.firstOnTap,
    required this.secondOnTap,
     this.secondButtonLabel,
    this.iconColor2,
    this.backgroundColor2,
  this.secondButtonIcon,
  this.centerWidget,
  this.titleStyle2,
    required this.body,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 20.paddingBottom,
      height: height ?? 155,
      clipBehavior: Clip.antiAlias,
      decoration: decoration ??
          Decorations.kDecorationBorder(
            radius: 10,
            borderWidth: 1
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 3,
              child: body),
          SizedBox(
            height: 40,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: RowTextsIconsButtons(
                icon1: AppIcons.call,
                hasOneButton: hasOneButton,
                icon2: secondButtonIcon ?? AppIcons.location_2,
                iconColor2: iconColor2,
                title1: strings.contact,
                title2: secondButtonLabel ?? strings.branches,
                backgroundColor2: backgroundColor2 ?? context.onSecondaryContainer,
                centerWidget: centerWidget,
                onPressed1: firstOnTap,
                onPressed2: secondOnTap,
                  titleStyle2: titleStyle2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
