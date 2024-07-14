import 'package:dalalah/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/widgets/pagination/pagination_widget.dart';
import '../../../../plates/domain/entities/plate.dart';
import '../../../../plates/presentation/plates/pages/plates_screen.dart';
import '../bloc/showroom_plates_bloc.dart';

class ShowroomPlatesPage extends BaseBlocWidget<DataSuccess<List<Plate>>, ShowroomPlateCubit> {
  final int id;
  ShowroomPlatesPage({Key? key, required this.id}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchShowroomPlates(id);
  }

  @override
  bool hasTabBarView(BuildContext context) {
    return true;
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Plate>> state) {
    return PaginationWidget(
      refreshController: bloc.refreshController,
      onRefresh: () {
        bloc.fetchShowroomPlates(id);
      },
      onLoading: () async {
        await bloc.fetchShowroomPlates(id,isRefresh: false);
      },
      child: PlatesScreen(
        plates: state.data ?? [],
        onFavoritePlate: (id) {
          bloc.togglePlateFavorite(id);
        },
      ),
    );
  }
}