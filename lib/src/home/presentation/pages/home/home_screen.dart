import '../../../../../core/widgets/buttons/row_see_all_text.dart';
import '../../../../main_index.dart';
import '../../widgets/plates_list.dart';
import '../../widgets/search_home.dart';
import '../../widgets/sections_list.dart';
import '../../widgets/slider_widget.dart';
import '../brands/brands_list.dart';
import '../../widgets/cars_list.dart';
import '../../widgets/home_sliders.dart';

class HomeScreen extends BaseStatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 40.paddingVert,
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchHome(),
          15.ph,
          const SliderWidget(),
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
                  CarsList(
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
