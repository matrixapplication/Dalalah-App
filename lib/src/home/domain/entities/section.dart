import 'package:delala/src/main_index.dart';

class Section {
  final String title;
  final String image;
  final String routeName;

  Section({required this.title, required this.image, required this.routeName});

  static getSections(BuildContext context) {
    return [
      Section(
        // title: context.strings.cars,
        title: 'cars',
        image: AppImages.car_with_background,
        routeName: Routes.login,
      ),
      Section(
        // title: context.strings.cars,
        title: 'cars',
        image: AppImages.car_with_background,
        routeName: Routes.login,
      ),
      Section(
        // title: context.strings.cars,
        title: 'cars',
        image: AppImages.car_with_background,
        routeName: Routes.login,
      ),
      Section(
        // title: context.strings.cars,
        title: 'cars',
        image: AppImages.car_with_background,
        routeName: Routes.login,
      ),
      Section(
        // title: context.strings.cars,
        title: 'cars',
        image: AppImages.car_with_background,
        routeName: Routes.login,
      ),
    ];
  }
}
