part of 'video_player_bloc.dart';

sealed class VideoPlayerEvent extends Equatable {
  const VideoPlayerEvent();

  @override
  List<Object> get props => [];
}

class LoadVideoEvent extends VideoPlayerEvent{
  @override
  List<Object> get props => [];
}