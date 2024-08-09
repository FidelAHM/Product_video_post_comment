import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gift_shop/core/routes.dart';
import 'package:gift_shop/core/utils/image_constant.dart';
import 'package:gift_shop/core/utils/padding.dart';
import 'package:gift_shop/core/utils/theme.dart';
import 'package:gift_shop/core/widget/appbar/custom_appbar.dart';
import 'package:gift_shop/features/videos/presentation/manager/bloc/video_player_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/cupertino.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    context.read<VideoPlayerBloc>().add(LoadVideoEvent());
    // flickManager = FlickManager(
    //     videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
    //         "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCommon(
            title: 'Video List',
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.whiteA700,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
                builder: (context, state) {
                  if (state is VideoLoadedState) {
                    return Column(
                      children: [
                        Container(
                          height: 600.h,
                          child: ListView.builder(
                            itemCount: state.videos.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final videos = state.videos[index];

                              return Padding(
                                padding: XPadding.allSidePadding5,
                                child: Card(
                                  color: AppColors.gray50,
                                  elevation: 0,
                                  child: ListTile(
                                    onTap: () {
                                      print(videos.id);
                                      Navigator.pushNamed(
                                          context, AppRoutes.videoDetail,
                                           arguments: videos
                                          );
                                    },
                                    leading: Image.asset(
                                      AppImages.play,
                                      height: 35.h,
                                      width: 35.h,
                                    ),
                                    title: Text(videos.title),
                                    subtitle: Text(videos.createdAt),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.darkGreen,
                                    ),
                                  ),
                                ),
                              );
                            },
                            scrollDirection: Axis.vertical,
                            padding: XPadding.onlyBottom10,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Shimmer.fromColors(
                        baseColor: AppColors.lightGrey,
                        highlightColor: AppColors.lightBlue100,
                        child: Padding(
                          padding: XPadding.allSidePadding,
                          child: Container(
                            height: 50.h,
                            width: 350.w,
                            color: AppColors.lightBlue,
                          ),
                        ));
                  }
                },
              ),
            ],
          ),
        )

        //  Center(
        //   child: AspectRatio(
        //       aspectRatio: 16 / 10,
        //       child: FlickVideoPlayer(flickManager: flickManager)),
        // ),
        );
  }
}
