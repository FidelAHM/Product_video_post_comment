part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();
  
  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}
class PostLoadingState extends PostState {
  @override
  List<Object> get props => [];
}

class PostDataLoadedState extends PostState {
  final List<PostModel> posts;
  PostDataLoadedState(this.posts);
  @override
  List<Object> get props => [posts];
}
class PostDataError extends PostState {
  final String error;
  PostDataError(this.error);
    @override
  List<Object> get props => [error];
}