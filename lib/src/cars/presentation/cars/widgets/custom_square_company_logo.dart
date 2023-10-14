import '../../../../main_index.dart';

class CustomSquareCompanyLogo extends BaseStatelessWidget {
  final String logoPath;
  final double? width;
  final double? height;
  final AlignmentDirectional? logoAlignment;

  CustomSquareCompanyLogo({
    super.key,
    required this.logoPath,
    this.logoAlignment,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: logoAlignment ?? AlignmentDirectional.centerStart,
      height: height ?? 70,
      width: width ?? 78,
      decoration: Decorations.kDecorationBorder(
        radius: 12,
        borderColor: const Color(0xffDDDDDD),
      ),
      child: Image.asset(
        logoPath,
        width: 65,
      ),
    );
  }
}
