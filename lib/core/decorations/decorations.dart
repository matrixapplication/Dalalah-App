import 'package:dalalah/src/main_index.dart';

class Decorations {
  static BoxDecoration kDecorationOnlyRadius({
    required Color color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
    );
  }

  static BoxDecoration kDecorationBorderRadius({
    Color? color,
    Color? colorBorder,
    BorderRadiusDirectional? borderRadius,
    double? width,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: borderRadius ?? BorderRadiusDirectional.circular(10),
      border: Border.all(
        color:
            colorBorder ?? injector<ServicesLocator>().appContext.dividerColor,
        width: width ?? 1.0,
      ),
    );
  }

  static BoxDecoration kDecorationTopRadius({
    required Color color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius ?? 12),
        topRight: Radius.circular(radius ?? 12),
      ),
    );
  }

  static ShapeDecoration mainShapeDecoration({
    double? radius,
    BorderRadiusDirectional? borderRadius,
  }) {
    return ShapeDecoration(
      gradient: const LinearGradient(
        begin: Alignment(0.00, -1.00),
        end: Alignment(0, 1),
        colors: [Color(0xFF033E4D), Color(0xFF055C72)],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 8),
      ),
    );
  }

  static BoxDecoration kDecorationLiftRadius({
    required Color color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(radius ?? 15),
        bottomStart: Radius.circular(radius ?? 15),
      ),
    );
  }

  static BoxDecoration kDecorationBottomRadius({
    required Color color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(radius ?? 25),
        bottomRight: Radius.circular(radius ?? 25),
      ),
    );
  }

  static BoxDecoration kDecorationTopEndRadius({
    required Color color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadiusDirectional.only(
        topEnd: Radius.circular(radius ?? 15),
      ),
    );
  }

  static BoxDecoration kDecorationBorderWithRadius({
    Color? color,
    double? radius,
    Color? borderColor,
    double? borderWidth,
    double? t,
  }) {
    return BoxDecoration(
      color: color ?? injector<ServicesLocator>().appContext.cardColor,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
      border: Border.all(
        color:
            borderColor ?? injector<ServicesLocator>().appContext.dividerColor,
        width: borderWidth ?? 1.0,
      ),
    );
  }

  static BoxDecoration kDecorationBottomBorder({
    Color? color,
    double? radius,
    Color? borderColor,
    double? borderWidth,
    double? t,
  }) {
    return BoxDecoration(
      // only bottom border
      border: Border(
        bottom: BorderSide(
          color: borderColor ??
              injector<ServicesLocator>().appContext.dividerColor,
          width: borderWidth ?? 1.0,
        ),
      ),
    );
  }

  static BoxDecoration kDecorationRadius({
    Color? color,
    double? radius,
    Color? borderColor,
    double? borderWidth,
    double? t,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
    );
  }

  static BoxDecoration boxShape({
    required Color color,
  }) {
    return BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    );
  }

  static ShapeDecoration shapeDecorationShadow(
      {Color? color,
      required Color colorShadow,
      double? radius,
      BorderRadiusGeometry? borderRadius}) {
    return ShapeDecoration(
      color: color ?? injector<ServicesLocator>().appContext.cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 5)),
      shadows: [
        BoxShadow(
          color: colorShadow.withOpacity(0.5),
          blurRadius: 10,
          offset: const Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }

  static ShapeDecoration shapeBottomShadow(
      {required Color color, required Color colorShadow, double? radius}) {
    return ShapeDecoration(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15)),
      shadows: [
        BoxShadow(
          color: colorShadow.withOpacity(0.05),
          blurStyle: BlurStyle.solid,
          offset: const Offset(100, 100),
        )
      ],
    );
  }

  static ShapeDecoration shapeTopShadow(
      {required Color color, required Color colorShadow, double? radius}) {
    return ShapeDecoration(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15)),
      shadows: [
        BoxShadow(
          color: colorShadow.withOpacity(0.2),
          blurRadius: 20,
          spreadRadius: 0,
        )
      ],
    );
  }


  static BoxDecoration decorationBorderShadow({
    Color? color,
    required Color borderColor,
    required Color colorShadow,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius ?? 12),
      border: Border.all(
        color: borderColor,
        width: 1.0,
      ),
      boxShadow: [
        BoxShadow(
          color: colorShadow.withOpacity(0.5),
          blurRadius: 10,
          offset: const Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }

  static BoxDecoration kDecorationBorder({
    Color? backgroundColor,
    double? radius,
    BorderRadiusDirectional? borderRadius,
    Color? borderColor,
    double? borderWidth,
    BorderStyle? borderStyle,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? Colors.white,
      borderRadius: borderRadius ??
          BorderRadius.all(
            Radius.circular(radius ?? 16),
          ),
      border: Border.all(
        color: borderColor ?? const Color(0xffEAEAEA),
        width: borderWidth ?? 1,
        style: borderStyle ?? BorderStyle.solid,
      ),
    );
  }

  static BoxDecoration kDecorationField() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.15),
        offset: const Offset(0, 0),
        blurRadius: 10,
      ),
    ],
        borderRadius: BorderRadius.circular(8));
  }

  static BoxDecoration kDecorationBoxShadow({
    Color? color,
    Color? colorShadow,
    double blurRadius = 4,
    double spreadRadius = 0.5,
    double radius = 10,
    BorderRadiusDirectional? borderRadius,
    Color? borderColor,
    double? borderWidth,
    Offset offset = const Offset(-2, 5),
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: colorShadow ?? const Color(0xffD6D6D6).withOpacity(0.25),
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
      ],
      border: Border.all(
        color: borderColor ?? Colors.white,
        width: borderWidth ?? 0,
        style: BorderStyle.solid,
      ),
    );
  }


  static BoxDecoration kDecorationCircle({
    Color? color,
  }) {
    return BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    );
  }
}
