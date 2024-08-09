import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:gift_shop/core/utils/padding.dart';
import 'package:gift_shop/core/utils/sizedbox.dart';
import 'package:gift_shop/core/utils/textstyle.dart';
import 'package:gift_shop/core/utils/theme.dart';
import 'package:gift_shop/core/widget/appbar/custom_appbar.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen();

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {


  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
          ..initialize().then((_) {
            setState(() {});
          }));
  }

  @override
  void dispose() {
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
          title: 'Another Video',
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteA700,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Column(
        children: [
          XGapHeight.h20,
          Padding(
            padding: XPadding.allSidePadding5,
            child: Card(
              elevation: 5,
              child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: FlickVideoPlayer(flickManager: flickManager)),
            ),
          ),
          XGapHeight.h20,
          Text(
            'Hope you are enjoying the video',
            style: AppTextStyle.txtInterSemiBold14DarkGreen,
          )
        ],
      ),
    );
  }
}
