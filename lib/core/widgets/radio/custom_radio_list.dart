
import '../../../src/main_index.dart';

class CustomRadioList extends StatelessWidget {
  final String title;
  final bool? isLast;
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic)? onChanged;
  final Color? backgroundColor;
  final double? radius;
  final Widget? suffix;
  const CustomRadioList({Key? key, required this.title, this.isLast = false, this.onChanged, required this.value, this.groupValue, this.backgroundColor, this.radius, this.suffix}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    dynamic selectValue = groupValue;
    return  InkWell(
      onTap: () {
        selectValue = value;
        onChanged!(selectValue);
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(top: 8, bottom: 14, left: 15, right: 15),
        decoration: Decorations.kDecorationOnlyRadius(color: backgroundColor ?? Theme.of(context).colorScheme.background, radius: radius ?? 0),
        child: Row(
          mainAxisAlignment: isLast! ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
          children: [
            if (isLast!)  Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AppIcon(
                icon: AppIcons.checkmarkCircle,
                size: 20,
                color:
                value == groupValue ? theme.colorScheme.primary : theme.dividerColor,
              ),
            ),

            Text(
              title,
              style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18),
            ),
            if (!isLast!)  AppIcon(
              icon: AppIcons.checkmarkCircle,
              color:
              value == groupValue ? theme.colorScheme.primary : theme.dividerColor,
            ),
            if(suffix != null) Row(
              children: [
                const Spacer(),
                suffix!,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
