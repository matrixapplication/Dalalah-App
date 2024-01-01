import 'package:dalalah/src/main_index.dart';
import 'package:dalalah/src/showrooms/domain/entities/showroom.dart';
import 'package:dalalah/src/showrooms/presentation/showrooms/pages/showrooms_screen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/widgets/pagination/pagination_widget.dart';
import '../bloc/followed_showrooms_bloc.dart';

class FollowedShowroomsPage extends BaseBlocWidget<DataSuccess<List<Showroom>>, FollowedShowroomsCubit> {
  FollowedShowroomsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFollowShowrooms();
  }



  @override
  String? title(BuildContext context) => strings.followed_showrooms;

  RefreshController refreshController =
  RefreshController(initialRefresh: false);
  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Showroom>> state) {
    if (bloc.isLastPage) {
      refreshController.loadNoData();
    }
    return PaginationWidget(
      refreshController: refreshController,
      onRefresh: () {
        bloc.fetchFollowShowrooms();
        refreshController.refreshCompleted();
      },
      onLoading: () async {
        await bloc.fetchFollowShowrooms(isMoreData: true);
        await Future.delayed(const Duration(milliseconds: 1200));
        if (bloc.isLastPage) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      },
      child: ShowroomsScreen(
        showrooms: state.data ?? [],
      ),
    );
    // return 0.ph;
  }
}