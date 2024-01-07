import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../data/models/add_comment_params.dart';
import '../../../data/models/comment_params.dart';
import '../../../domain/entities/comment.dart';
import '../../../domain/use_cases/cars_usecase.dart';

@Injectable()
class CommentsCubit extends BaseCubit {
  final CarsUseCase usecase;

  CommentsCubit(this.usecase);

  List<Comment> allComments = [];
  List<Comment> comments = [];
  int page = 0;
  bool isLastPage = false;

  fetchComments(CommentParams params, {bool isMoreData = true}) async {
    isMoreData ? {page = 1, allComments.clear()} : page++;
    params.page = page;
    executeBuilder(() => usecase.fetchComments(params), isRefresh: isMoreData,
        onSuccess: (data) {
      isLastPage = (data.pagination?.totalPages)! <= page;
      comments = data.data?.map((e) => Comment.fromDto(e)).toList() ?? [];
      allComments.addAll(comments);
      if(comments.isEmpty){
        throw EmptyListException();
      } else {
        emit(DataSuccess<List<Comment>>(allComments));
      }
    });
  }

  addComment(AddCommentParams params) async {
    executeEmitterListener(() => usecase.addComment(params));
  }
}
