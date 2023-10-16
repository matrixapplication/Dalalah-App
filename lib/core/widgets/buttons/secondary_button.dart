import '../../../src/main_index.dart';
import '../clickable_widget.dart';

class SecondaryButton extends StatelessWidget {
  final String? label;
  final Function()? onPressed;
  final Widget? child;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? labelColor;
  final double? borderWidth;
  final double radius;
  final BorderRadiusDirectional? borderRadius;
  final double? topLeftRadius;
  final double? bottomLeftRadius;
  final double? topRightRadius;
  final double? bottomRightRadius;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final Color? shadowColor;

  // final bool labelIsIcon;
  final Widget? icon;

  const SecondaryButton({
    Key? key,
    this.label,
    this.onPressed,
    this.height = 50,
    this.backgroundColor,
    this.radius = 13,
    this.topLeftRadius,
    this.bottomLeftRadius,
    this.topRightRadius,
    this.bottomRightRadius,
    this.labelStyle,
    this.margin,
    this.padding,
    this.width,
    this.borderColor,
    this.labelColor,
    this.borderWidth,
    this.borderRadius,
    this.decoration,
    // this.labelIsIcon = false,
    this.icon,
    this.child,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClickableWidget(
      onTap: onPressed ?? () {},
      child: Container(
        height: height,
        width: width ?? double.infinity,
        margin: margin,
        padding: const EdgeInsetsDirectional.only(bottom: 3),
        alignment: Alignment.center,
        decoration: decoration ??
            Decorations.kDecorationBoxShadow(
              color: backgroundColor ?? context.primaryColor,
              radius: radius,
              borderRadius: borderRadius,
              borderColor: borderColor,
              borderWidth: borderWidth,
              colorShadow: shadowColor,

            ),
        child: icon ??
            child ??
            Text(
              label ?? 'Enter',
              style: labelStyle ??
                  context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: labelColor ?? Colors.white,
                  ),
            ),
      ),
    );
  }
}
