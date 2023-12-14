import 'package:dalalah/core/components/base_widget_bloc.dart';
import '../../../main_index.dart';
import '../bloc/favorites_bloc.dart';
import 'favorites_screen.dart';

class FavoritesAndAdsPage
    extends BaseBlocWidget<DataSuccess<List<String>>, FavoritesCubit> {
  FavoritesAndAdsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFavorites();
  }



  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<String>> state) {
    return FavoritesAndAdsScreen(favorites: bloc.state.data);
  }
}
