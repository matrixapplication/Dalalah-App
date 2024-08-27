import '../../../../core/routes/app_links_service.dart';
import '../../../../core/widgets/buttons/row_see_all_text.dart';
import '../../../main_index.dart';
import '../../../plates/domain/entities/plate.dart';
import '../../../real_estate/data/models/real_estate_model.dart';
import '../../domain/entities/brand.dart';
import '../../domain/entities/car.dart';
import '../../domain/entities/slide.dart';
import '../widgets/plates_list.dart';
import '../widgets/real_estates_list.dart';
import '../widgets/search_home.dart';
import '../../../add__ads/widgets/ads_types_list.dart';
import '../widgets/slider_widget.dart';
import '../widgets/cars_home_list.dart';

class HomeScreen extends BaseStatelessWidget {
  final StreamStateInitial<List<Slide>?> slidesStream ;
  final StreamStateInitial<List<Brand>?> brandsStream;
  final StreamStateInitial<List<Car>?> yourCarsStream;
  final StreamStateInitial<List<Plate>?> platesStream;
  final StreamStateInitial<RealEstatesModel?> realEstatesStream;
  final Function(int)? onFavoriteCar;
  final Function(int)? onFavoritePlate;
  final Future<List<Car>>? Function(String)? onSearch;
  final Function(int)? onToggleFavorite;
  HomeScreen({Key? key, required this.slidesStream, required this.brandsStream, required this.yourCarsStream, required this.platesStream, this.onFavoriteCar, this.onFavoritePlate, this.onSearch, this.onToggleFavorite,required this.realEstatesStream, }) : super(key: key);

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 40.paddingVert,
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchHome(
            onSearch: onSearch,
            onToggleFavorite: onToggleFavorite,
          ),
          15.ph,
          SliderWidget(
            slidesStream: slidesStream,
          ),
          25.ph,
          const AdTypesList(),
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
                  CarsHomeListHorizStream(
                    carsStream: yourCarsStream,
                    onToggleFavorite: (id) async => await onFavoriteCar!(id),
                  ),
                  RowSeeAllText(
                    title: strings.latest_paintings,
                    routeName: Routes.platesPage,
                  ),
                  PlatesList(
                    platesStream: platesStream,
                    onFavoritePlate: (id) async => await onFavoritePlate!(id),
                  ),
                  RowSeeAllText(
                    routeName: Routes.realEstatePage,
                    title: context.strings.latest_properties,
                  ),
                  RealEstatesList(
                    realEstatesStream: realEstatesStream,
                    onFavoritePlate: (id) async => await onFavoritePlate!(id),
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
