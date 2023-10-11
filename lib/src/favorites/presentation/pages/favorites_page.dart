
import 'package:delala/core/components/base_widget_bloc.dart';

import '../../../main_index.dart';
import '../../../sell_car/domain/entities/shipment.dart';
import '../bloc/favorites_bloc.dart';
import 'favorites_screen.dart';


class FavoritesPage extends BaseBlocWidget<DataSuccess<List<String>>, FavoritesCubit> {
  FavoritesPage({Key? key}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFavorites();
  }

  @override
  String? title(context)=> strings.favorites;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<String>> state) {
    return FavoritesScreen(favorites: bloc.state.data);
  }

}
