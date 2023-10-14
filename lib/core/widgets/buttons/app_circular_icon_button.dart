import '../../../src/main_index.dart';

class AppCircularIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;
  final double? size;
  final double? circleSize;
  final Color? color;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double? radius;
  final double? padding;
  final EdgeInsetsGeometry? margin;

  const AppCircularIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.size,
    this.color,
    this.radius,
    this.backgroundColor,
    this.padding,
    this.shadowColor,
    this.margin,
    this.circleSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 10),
      margin: margin ?? EdgeInsets.zero,
      width: circleSize ?? 30,
      height: circleSize ?? 30,
      // decoration: BoxDecoration(
      //   color: backgroundColor ?? Colors.transparent,
      //   shape: BoxShape.circle,
      //   boxShadow: [
      //     BoxShadow(
      //       color: shadowColor ?? Colors.black.withOpacity(0.2),
      //       blurRadius: 8,
      //       offset: const Offset(0, 5),
      //     ),
      //   ],
      // ),
      decoration: Decorations.kDecorationBoxShadow(
          radius: 100,
          offset: const Offset(0, 4),
          colorShadow: const Color(0xff8E8E8E).withOpacity(0.25)),
      child: AppIconButton(
        icon: icon,
        color: color,
        size: size,
        onPressed: onPressed,
      ),
    );
  }
}
