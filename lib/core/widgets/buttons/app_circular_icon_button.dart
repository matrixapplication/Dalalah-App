
import '../../../src/main_index.dart';

class AppCircularIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;
  final double? size;
  final Color? color;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double? radius;
  final double? padding;
  final EdgeInsetsGeometry? margin;
  const AppCircularIconButton({Key? key, required this.icon, this.onPressed, this.size, this.color, this.radius, this.backgroundColor, this.padding, this.shadowColor, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 10),
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: AppIconButton(
        icon: icon,
        color: color,
        size: size,
        onPressed: onPressed,
      ),
    );
  }
}
