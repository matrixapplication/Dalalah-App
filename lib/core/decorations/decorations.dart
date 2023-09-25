import 'package:arabitac/src/main_index.dart';

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
  static BoxDecoration kDecorationBorderRadius({
    Color? color,
    double? radius,
    Color? borderColor,
    double? borderWidth,
    double? t,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 12)),
      border: Border.all(
        color: borderColor ?? kBorderColor,
        width: borderWidth ?? 1.0,
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
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 12.r)),
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

  static ShapeDecoration shapeDecorationShadow({Color? color, required Color colorShadow, double? radius, BorderRadiusGeometry? borderRadius}) {
    return ShapeDecoration(
      color: color ?? injector<ServicesLocator>().appContext.cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 5)),
      shadows: [
        BoxShadow(
          color: colorShadow.withOpacity(0.5),
          blurRadius: 10,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }
  static ShapeDecoration shapeBottomShadow({required Color color, required Color colorShadow, double? radius}) {
    return ShapeDecoration(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15)),
      shadows: [
        BoxShadow(
          color: colorShadow.withOpacity(0.05),
          blurStyle: BlurStyle.solid,
          offset: Offset(100, 100),
        )
      ],
    );
  }

  static ShapeDecoration shapeTopShadow({required Color color, required Color colorShadow, double? radius}) {
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

  static BoxDecoration decorationBorderShadow({Color? color, required Color borderColor, required Color colorShadow, double? radius}) {
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
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }
}
