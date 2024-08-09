import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gift_shop/core/navigator_key.dart';
import 'package:gift_shop/core/widget/dialog/custom_snack_bard.dart';
import 'package:gift_shop/features/videos/data_source/Model/video_player_model.dart';
import 'package:gift_shop/features/videos/data_source/video_player_datasource.dart';
import 'package:gift_shop/features/videos/data_source/Model/video_player_model.dart';

part 'video_player_event.dart';
part 'video_player_state.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  VideoPlayerBloc() : super(VideoPlayerInitial()) {
    on<LoadVideoEvent>((event, emit) async {
      emit(VideoLoadingState());
      try {
        final videos = await VideoPlayerRepository().listVideos();
        print('___________success');
        emit(VideoLoadedState(videos as List<VideoPlayerModel>));
      } catch (e) {
        print('_________Error${e}');
        CustomSnackbar(navigatorKey.currentContext!)
            .showErrorMessage('An error an occured');
        emit(VideoError('An error has occured'));
      }
    });
  }
}
