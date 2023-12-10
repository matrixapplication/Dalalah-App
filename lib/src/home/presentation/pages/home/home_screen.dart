import '../../../../../core/widgets/buttons/row_see_all_text.dart';
import '../../../../main_index.dart';
import '../../../domain/entities/brand.dart';
import '../../../domain/entities/car.dart';
import '../../../domain/entities/slide.dart';
import '../../widgets/plates_list.dart';
import '../../widgets/search_home.dart';
import '../../widgets/sections_list.dart';
import '../../widgets/slider_widget.dart';
import '../../widgets/cars_home_list.dart';

class HomeScreen extends BaseStatelessWidget {
  final StreamStateInitial<List<Slide>?> slidesStream ;
  final StreamStateInitial<List<Brand>?> brandsStream;
  final StreamStateInitial<List<Car>?> yourCarsStream;
  final StreamStateInitial<List<Car>?> otherCarsStream;
  final Function(int)? onFavoriteCar;
  final Function(int)? onFavoritePlate;
  HomeScreen({Key? key, required this.slidesStream, required this.brandsStream, required this.yourCarsStream, required this.otherCarsStream, this.onFavoriteCar, this.onFavoritePlate}) : super(key: key);

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 40.paddingVert,
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchHome(),
          15.ph,
          SliderWidget(
            slidesStream: slidesStream,
          ),
          25.ph,
          SectionsList(),
          Container(
            color: context.cardColor,
            child: SingleChildScrollView(
              padding: 8.paddingTop,
              controller: scrollController,
              child: Column(
                children: [
                  RowSeeAllText(
                    routeName: Routes.carsPage,
                    title: context.strings.latest_cars,
                  ),
                  CarsHomeListHoriz(
                    title: strings.year_models,
                    routeName: Routes.carsPage,
                  ),
                  RowSeeAllText(
                    title: strings.latest_paintings,
                    routeName: Routes.platesPage,
                  ),
                  PlatesList(
                    title: strings.plates,
                    routeName: Routes.platesPage,
                  ),
                ],
              )
            ),
          ),

        ],
      ),
    );
  }
}
