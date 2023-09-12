
import '../../../src/main_index.dart';

class CustomListTile2 extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final String? iconLeading;
  final Color? iconLeadingColor;
  final double? iconLeadingSize;
  final Widget? trailing;
  final Function()? onTap;
  final bool? isArrowForward;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? leading;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;

  const CustomListTile2(
      {Key? key,
      required this.title,
      this.titleStyle,
      this.subtitle,
      this.iconLeading,
      this.iconLeadingColor,
      this.iconLeadingSize,
      this.trailing,
      this.onTap,
      this.isArrowForward,
      this.contentPadding,
      this.leading,
      this.backgroundColor,
      this.margin,
      this.decoration,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: contentPadding ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: margin,
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor ?? context.cardColor,
          ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            leading ??
             AppIcon(
                icon: iconLeading ?? AppIcons.clock,
                color: iconLeadingColor ?? context.primaryColor,
                size: iconLeadingSize ?? 20),
            const SizedBox(width: 14),
            Text(title, style: titleStyle ?? context.titleSmall!.copyWith(fontSize: 16)),
            const Spacer(),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
