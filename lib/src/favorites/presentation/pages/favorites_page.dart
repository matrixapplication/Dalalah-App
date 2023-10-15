import 'package:delala/core/components/base_widget_bloc.dart';

import '../../../../core/widgets/tabview/animated_tabs_bar.dart';
import '../../../main_index.dart';
import '../../../sell_car/domain/entities/shipment.dart';
import '../bloc/favorites_bloc.dart';
import 'favorites_screen.dart';
import 'views/favourite_buildings_view.dart';
import 'views/favourite_cars_view.dart';
import 'views/favourite_plates_view.dart';

class FavoritesPage
    extends BaseBlocWidget<DataSuccess<List<String>>, FavoritesCubit> {
  FavoritesPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFavorites();
  }

  @override
  String? title(context) => strings.favorites;

  @override
  bool hasTabBarView(context) => true;

  // @override
  // List<TabModel> tabs(BuildContext context) {
  //   return [
  //     TabModel(label: context.strings.cars),
  //     TabModel(label: context.strings.plates),
  //     TabModel(label: 'عقارات'),
  //   ];
  // }
  @override
  Widget build(BuildContext context) {
    this.context = context;
    //onBuild(bloc);
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
    return [
      const FavouriteCarsView(),
      FavouritePlatesView(),
      FavouriteBuildingView(),
    ];
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<String>> state) {
    return FavoritesScreen(favorites: bloc.state.data);
  }
}
