part of 'video_player_bloc.dart';

sealed class VideoPlayerState extends Equatable {
  const VideoPlayerState();

  @override
  List<Object> get props => [];
}

final class VideoPlayerInitial extends VideoPlayerState {}

class VideoLoadingState extends VideoPlayerState {
  @override
  List<Object> get props => [];
}

class VideoLoadedState extends VideoPlayerState {
  final List<VideoPlayerModel> videos;
  VideoLoadedState(this.videos);
  @override
  List<Object> get props => [videos];
}

class VideoError extends VideoPlayerState {
  final String error;
  VideoError(this.error);
     @override
  List<Object> get props => [error];

}
