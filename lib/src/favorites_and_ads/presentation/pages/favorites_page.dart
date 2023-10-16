import 'package:delala/core/components/base_widget_bloc.dart';
import '../../../../core/widgets/tabview/animated_tabs_bar.dart';
import '../../../main_index.dart';
import '../bloc/favorites_bloc.dart';
import 'favorites_screen.dart';
import 'views/favourite_buildings_view.dart';
import 'views/favourite_cars_view.dart';
import 'views/favourite_plates_view.dart';

class FavoritesAndAdsPage
    extends BaseBlocWidget<DataSuccess<List<String>>, FavoritesCubit> {
  FavoritesAndAdsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFavorites();
  }

  @override
  String? title(context) {
    return !getArguments(context) ? strings.favorites : strings.my_ads;
  }

  @override
  bool hasTabBarView(context) => true;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return mainFrame(
      body: buildConsumer(context),
      tabs: [
        TabModel(label: context.strings.cars),
        TabModel(label: context.strings.plates),
        TabModel(label: context.strings.buildings),
      ],
    );
  }

  @override
  List<Widget> tabViews(BuildContext context) {
    bool isAddView = getArguments(context);
    return [
      FavouriteAndAdsCarsView(
        isAddView: isAddView,
      ),
      FavouritePlatesView(
        isAddView: isAddView,
      ),
      FavouriteBuildingView(
        isFavouriteView: isAddView,
      ),
    ];
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<String>> state) {
    return FavoritesAndAdsScreen(favorites: bloc.state.data);
  }
}
