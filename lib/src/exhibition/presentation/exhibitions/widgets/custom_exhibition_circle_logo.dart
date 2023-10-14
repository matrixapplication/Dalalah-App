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
      child: Column(
        children: [
          8.ph,
          Image.asset(
            AppImages.car_name,
            height: 35,
          ),
          Text(
            name,
            style: context.textTheme.headlineSmall!.copyWith(
              color: AppColors.grey_41,
              fontSize: 8,
            ),
          )
        ],
      ),
    );
  }
}
