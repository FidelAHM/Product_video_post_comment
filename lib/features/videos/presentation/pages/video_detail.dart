import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gift_shop/core/routes.dart';
import 'package:gift_shop/core/utils/sizedbox.dart';
import 'package:gift_shop/core/utils/theme.dart';
import 'package:gift_shop/core/widget/appbar/custom_appbar.dart';
import 'package:gift_shop/features/videos/data_source/Model/video_player_model.dart';
import 'package:gift_shop/features/videos/presentation/manager/bloc/video_player_bloc.dart';
import 'package:gift_shop/features/videos/presentation/video_detail.dart/bloc/video_detail_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';

class VideoDetail extends StatefulWidget {
  const VideoDetail({super.key});

  @override
  State<VideoDetail> createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  // String videoUrl = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as VideoPlayerModel;
    return Scaffold(
      appBar: AppBarCommon(
          title: 'Video Player',
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteA700,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Column(children: [
        XGapHeight.h20,
        Center(
          child: AspectRatio(
              aspectRatio: 16 / 10,

              // child: VideoPlayer(_controller),
              child: FlickVideoPlayer(
                  flickManager: FlickManager(
                      videoPlayerController:
                          VideoPlayerController.networkUrl(Uri.parse(
                item.videoUrl ??
                    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
              ))
                            ..initialize().then((_) {
                              setState(() {});
                            })))),
        ),
        XGapHeight.h20,
        TextButton(
          focusNode: FocusNode(),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.videoPlayerScreen);
            },
            child: Text('Not Working Watch another video')),
      ]),
    );
  }
}
