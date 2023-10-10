import '../../../../../core/widgets/buttons/row_see_all_text.dart';
import '../../../../main_index.dart';
import '../brands/brands_list.dart';
import '../../widgets/cars_list.dart';
import '../../widgets/home_sliders.dart';

class HomeScreen extends BaseStatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.scaffoldBackgroundColor,
      child: SingleChildScrollView(
        padding: 20.paddingBottom,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeSliders(),
            RowSeeAllText(
              routeName: Routes.brandsPage,
              title: context.strings.popular_brand,
            ),
            SizedBox(
              height: 200,
              child: BrandsList(
                isHome: true,
              ),
            ),
            RowSeeAllText(
              title: strings.year_models,
              routeName: Routes.carsPage,
            ),
            CarsList(
              title: strings.year_models,
              routeName: Routes.carsPage,
            ),
            RowSeeAllText(
              title: strings.other_models,
              routeName: Routes.carsPage,
            ),
            CarsList(
              title: strings.other_models,
              routeName: Routes.carsPage,
            ),
          ],
        ),
      ),
    );
  }
}
