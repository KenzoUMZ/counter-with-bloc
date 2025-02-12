import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/dio/repository_comments_dio.dart';
import '../../../domain/entities/comments.dart';
import 'comments_cubit_state.dart';

class CommentsCubit extends Cubit<CommentsCubitState> {
  CommentsCubit() : super(const CommentsCubitState());

  Future<void> getComments() async {
    emit(
      state.copyWith(
        isLoading: true, 
        comments: [],
      ),
    );
    List<Comments> comments = await fetchComments();
    emit(
      state.copyWith(
        isLoading: false,
        comments: comments,
      )
    );
  }
}
