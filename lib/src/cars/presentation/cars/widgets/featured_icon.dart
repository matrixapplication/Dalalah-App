import '../../../../main_index.dart';

class FeaturedIcon extends StatelessWidget {
  const FeaturedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(),
        shadows: [
          BoxShadow(
            color: Color(0x3F8D8D8D),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Image.asset(AppImages.primary_car),
    );
  }
}
