

import '../../../src/main_index.dart';

class CustomListTile extends StatelessWidget {
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
  final Color? tileColor;
  const CustomListTile({Key? key, required this.title, this.subtitle, this.iconLeading, this.trailing, this.onTap, this.isArrowForward = false, this.contentPadding, this.iconLeadingColor, this.titleStyle, this.iconLeadingSize, this.leading, this.tileColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 50,
      child: ListTile(
        tileColor: tileColor ?? theme.colorScheme.background,

        leading: leading ?? AppIcon(icon: iconLeading ?? AppIcons.clock, color: iconLeadingColor ?? theme.primaryColor, size: iconLeadingSize ?? 20),
        minVerticalPadding: 11,
        title: Text(title, style: titleStyle ?? theme.textTheme.bodyMedium!.copyWith(fontSize: 18)),
        subtitle: Text(subtitle ?? '', style: theme.textTheme.displayMedium),
        trailing:
        (trailing == null && isArrowForward == false) ?    null :

        SizedBox(
          width: 40,
          child:
          Row(
            children: [
              if(trailing != null) trailing!,
              if(!isArrowForward!) const SizedBox(width: 5),
              isArrowForward == true ? const AppIcon(icon: AppIcons.leftArrow, color: kGreyColor, size: 15) : const SizedBox(),
            ],
          ),
        ),
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 10),
        visualDensity: VisualDensity.compact,
        onTap: onTap,
      ),
    );
  }
}
