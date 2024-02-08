import '../../../../main_index.dart';

class CustomExhibitionCircleLogo extends BaseStatelessWidget {
  final String logoPath;
  final String name;

  CustomExhibitionCircleLogo({
    super.key,
    required this.logoPath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: Colors.white,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              AppImages.splash_logo,
              height: 60,
              color: context.primaryColor,
            ),
          ),
          Positioned(
            bottom: 12,
            child: Text(
              name.split(' ').first,
              style: context.textTheme.headlineSmall!.copyWith(
                color: AppColors.grey_41,
                fontSize: 8,
              ),
            ),
          )
        ],
      ),
    );
  }
}
