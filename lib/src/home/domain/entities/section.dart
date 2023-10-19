import 'package:delala/src/main_index.dart';

class Section {
  final String title;
  final String image;
  final String routeName;
  final double width;
  final double imageSize;

  Section({required this.title, required this.image, required this.routeName, this.imageSize = 80, this.width = 100});

  static getSections(BuildContext context) {
    return [
      Section(
        // title: context.strings.cars,
        title: context.strings.cars,
        image: AppImages.car_section,
        routeName: Routes.carsPage,
      ),
      Section(
        // title: context.strings.cars,
        title: context.strings.plates,
        image: AppImages.double_plate,
        routeName: Routes.platesPage,
      ),
      Section(
        title: context.strings.financing_services,
        image: AppImages.car_section,
        routeName: Routes.installmentPage,
      ),
      Section(
        title: context.strings.real_estate,
        image: AppImages.house_location,
        routeName: Routes.login,
      ),
    ];
  }
}
