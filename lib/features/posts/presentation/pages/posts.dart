import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gift_shop/core/routes.dart';
import 'package:gift_shop/core/utils/padding.dart';
import 'package:gift_shop/core/utils/sizedbox.dart';
import 'package:gift_shop/core/utils/theme.dart';
import 'package:gift_shop/core/widget/appbar/custom_appbar.dart';
import 'package:gift_shop/features/posts/presentation/manager/bloc/post_bloc.dart';
import 'package:gift_shop/features/posts/presentation/widgets/posts_content.dart';
import 'package:shimmer/shimmer.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(LoadPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
          title: 'Posts',
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.whiteA700,
              ))),
      body: SingleChildScrollView(
        child: Padding(
          padding: XPadding.allSidePadding5,
          child: Column(
            children: [
              XGapHeight.h10,
              BlocBuilder<PostBloc, PostState>(builder: (context, state) {
                if (state is PostDataLoadedState) {
                  return Container(
                    height: 600.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.posts.length,
                        padding: XPadding.onlyBottom,
                        itemBuilder: (context, index) {
                          final posts = state.posts[index];
                          return PostsContent(
                              body: posts.body,
                              comment: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.comments,
                                    arguments: posts
                                    );
                              },
                              dislike: posts.dislikes.toString(),
                              like: posts.likes.toString(),
                              title: posts.title,
                              view: posts.views.toString());
                        }),
                  );
                } else {
                  return Shimmer.fromColors(
                      baseColor: AppColors.lightGrey,
                      highlightColor: AppColors.lightBlue100,
                      child: Padding(
                        padding: XPadding.allSidePadding,
                        child: Container(
                          height: 100.h,
                          width: 300.w,
                          color: AppColors.lightBlue,
                        ),
                      ));
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
