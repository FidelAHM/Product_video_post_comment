import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gift_shop/core/utils/padding.dart';
import 'package:gift_shop/core/utils/theme.dart';
import 'package:gift_shop/core/widget/appbar/custom_appbar.dart';
import 'package:gift_shop/features/comment/presentation/Manager/bloc/comment_bloc.dart';
import 'package:gift_shop/features/comment/presentation/widgets/comment_content.dart';
import 'package:gift_shop/features/posts/Data_source/Model/post_model.dart';
import 'package:shimmer/shimmer.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  void initState() {
    super.initState();
    context.read<CommentBloc>().add(LoadCommentEvent());
  }

  @override
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as PostModel;
    return Scaffold(
      appBar: AppBarCommon(
        title: 'Comments',
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.whiteA700,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: XPadding.allSidePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
                if (state is CommentDataLoadedState) {
                  return Container(
                    height: 700,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          final comments = state.comments[item.id];
                          return CommentContent(
                              body: comments.body,
                              like: comments.likes.toString(),
                              userName: comments.username,
                              fullName: comments.fullName);
                        }),
                  );
                } else {
                  return Shimmer.fromColors(
                      baseColor: AppColors.lightGrey,
                      highlightColor: AppColors.lightBlue100,
                      child: Padding(
                        padding: XPadding.allSidePadding,
                        child: Container(
                          height: 70.h,
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

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(text),
    );
  }
}
