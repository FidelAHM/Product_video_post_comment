part of 'comment_bloc.dart';

sealed class CommentState extends Equatable {
  const CommentState();
  
  @override
  List<Object> get props => [];
}

final class CommentInitial extends CommentState {}
class CoomentLoadingState extends CommentState {
  @override
  List<Object> get props => [];
}
class CommentDataLoadedState extends CommentState {
  final List<CommentModel> comments;
  CommentDataLoadedState(this.comments);
  @override
  List<Object> get props => [comments];
}

class CommentDataError extends CommentState {
  final String error;
  CommentDataError(this.error);
    @override
  List<Object> get props => [error];
}