part of 'video_detail_bloc.dart';

sealed class VideoDetailState extends Equatable {
  const VideoDetailState();
  
  @override
  List<Object> get props => [];
}

final class VideoDetailInitial extends VideoDetailState {}
class VideoLoadingState extends VideoDetailState {
  @override
  List<Object> get props => [];
}

class VideoLoadedDetailState extends VideoDetailState {
  final String videoUrl;
  VideoLoadedDetailState(this.videoUrl);
  @override
  List<Object> get props => [videoUrl];
}

class VideoDetailError extends VideoDetailState {
  final String error;
  VideoDetailError(this.error);
     @override
  List<Object> get props => [error];

}