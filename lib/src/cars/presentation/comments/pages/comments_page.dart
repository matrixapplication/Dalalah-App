import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../core/widgets/pagination/pagination_widget.dart';
import '../../../../main_index.dart';
import '../../../data/models/add_comment_params.dart';
import '../../../data/models/comment_params.dart';
import '../../../domain/entities/comment.dart';
import '../../cars_details/widgets/add_rating_widget.dart';
import '../bloc/comments_bloc.dart';
import 'comments_screen.dart';

class CommentsPage
    extends BaseBlocWidget<DataSuccess<List<Comment>>, CommentsCubit> {
  final CommentParams params;

  CommentsPage({Key? key, required this.params}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchComments(params);
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(
        body: Padding(
      padding: 16.paddingAll,
      child: Column(
        children: [
          AddCommentWidget(
            onAddComment: (comment) {
              bloc.addComment(AddCommentParams(
                body: comment,
                carId: params.carId,
                plateId: params.plateId,
              ));
            },
          ),
          Expanded(child: buildConsumer(context)),
        ],
      ),
    ));
  }

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Comment>> state) {
    if (bloc.isLastPage) {
      print('isLastPage ${bloc.isLastPage}');
      refreshController.loadNoData();
    }
    return PaginationWidget(
      refreshController: refreshController,
      onRefresh: () {
        loadInitialData(context);
        refreshController.refreshCompleted();
      },
      onLoading: () async {
        await bloc.fetchComments(params, isMoreData: true);
        await Future.delayed(const Duration(milliseconds: 1200));
        if (bloc.isLastPage) {
          print('isLastPage ${bloc.isLastPage}');
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      },
      child: CommentsScreen(
        comments: state.data ?? [],
        onReport: (commentId) {
          bloc.reportComment(commentId);
        },
        onDelete: (commentId) {
          bloc.deleteComment(commentId);
        },
      ),
    );
  }

  @override
  void onSuccessDismissed() {
    loadInitialData(context!);
  }
}
