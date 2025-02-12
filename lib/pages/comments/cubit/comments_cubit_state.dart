import 'package:equatable/equatable.dart';

import '../../../domain/entities/comments.dart';

class CommentsCubitState extends Equatable {
  final bool isLoading;
  final List<Comments> comments;

  const CommentsCubitState({
    this.isLoading = false,
    this.comments = const [],
  });

  CommentsCubitState copyWith({
    bool? isLoading,
    required List<Comments> comments,
  }) {
    return CommentsCubitState(
      isLoading: isLoading ?? this.isLoading,
      comments: comments ?? this.comments,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        comments,
      ];
}
