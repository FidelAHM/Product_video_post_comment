part of 'video_detail_bloc.dart';

sealed class VideoDetailEvent extends Equatable {
  const VideoDetailEvent();

  @override
  List<Object> get props => [];
}
class LoadVideoDetailEvent extends VideoDetailEvent{
  @override
  List<Object> get props => [];
}