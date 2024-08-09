import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gift_shop/core/navigator_key.dart';
import 'package:gift_shop/core/widget/dialog/custom_snack_bard.dart';
import 'package:gift_shop/features/videos/data_source/video_player_datasource.dart';

part 'video_detail_event.dart';
part 'video_detail_state.dart';

class VideoDetailBloc extends Bloc<VideoDetailEvent, VideoDetailState> {
  VideoDetailBloc() : super(VideoDetailInitial()) {
    on<LoadVideoDetailEvent>((event, emit) async {
      emit(VideoLoadingState());
      try{
        final video = await VideoPlayerRepository().VideoDetail();
        print('________success');
        emit(VideoLoadedDetailState(video));
      }catch (e){
         print('_________Error${e}');
        CustomSnackbar(navigatorKey.currentContext!)
            .showErrorMessage('An error an occured');
        emit(VideoDetailError('An error has occured'));
      }
    });
  }
}
