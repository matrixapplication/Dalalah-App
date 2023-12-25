import 'package:dalalah/src/main_index.dart';
import 'package:dalalah/src/showrooms/domain/entities/showroom.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/widgets/pagination/pagination_widget.dart';
import '../bloc/showrooms_bloc.dart';
import 'showrooms_screen.dart';

class ShowroomsPage extends BaseBlocWidget<DataSuccess<List<Showroom>>, ShowroomsCubit> {
  final bool? isAgency;
  ShowroomsPage({Key? key, this.isAgency}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchShowrooms(isAgency: isAgency ?? false);
  }


  RefreshController controller = RefreshController(initialRefresh: false);
  ScrollController scrollController = ScrollController();

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Showroom>> state) {
    return PaginationWidget(
      refreshController: controller,
      onRefresh: () {
        loadInitialData(context);
        controller.refreshCompleted();
      },
      onLoading: () async {
        await bloc.fetchShowrooms(isRefresh: false);
        await Future.delayed(const Duration(milliseconds: 1200));
        if (bloc.showrooms.isEmpty) {
          controller.loadNoData();
        } else {
          controller.loadComplete();
        }
      },
      child: ShowroomsScreen(
        isAgency: isAgency,
        showrooms: state.data ?? [],
      ),
    );
  }

  // @override
  // String? title(BuildContext context) {
  //   return getArguments(context) ?? strings.exhibitions;
  // }

}
