import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gift_shop/core/utils/image_constant.dart';
import 'package:gift_shop/core/utils/padding.dart';
import 'package:gift_shop/core/utils/sizedbox.dart';
import 'package:gift_shop/core/utils/textstyle.dart';
import 'package:gift_shop/core/utils/theme.dart';
import 'package:flutter/cupertino.dart';

class PostsContent extends StatelessWidget {
  final String title;
  final String body;
  final String like;
  final String dislike;
  final String view;
  final Function comment;
  PostsContent({
    required this.body,
    required this.comment,
    required this.dislike,
    required this.like,
    required this.title,
    required this.view,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: XPadding.allSidePadding55,
      child: Column(
        children: [
          _buildSectionTitle(title),
          XGapHeight.h5,
          _buildParagraph(body),
          XGapHeight.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                color: AppColors.gray50,
                elevation: 1,
                child: Padding(
                  padding: XPadding.allSidePadding55,
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.like,
                        height: 20.h,
                        width: 20.h,
                      ),
                      XGapWidth.w3,
                      Text(like),
                    ],
                  ),
                ),
              ),
              XGapWidth.w10,
              Card(
                color: AppColors.gray50,
                elevation: 1,
                child: Padding(
                  padding: XPadding.allSidePadding55,
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.dislike,
                        height: 20.h,
                        width: 20.h,
                      ),
                      XGapWidth.w3,
                      Text(dislike),
                    ],
                  ),
                ),
              ),
              XGapWidth.w10,
              Card(
                color: AppColors.gray50,
                elevation: 1,
                child: Padding(
                  padding: XPadding.allSidePadding55,
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.view,
                        height: 20.h,
                        width: 20.h,
                      ),
                      XGapWidth.w3,
                      Text(view),
                    ],
                  ),
                ),
              ),
              XGapWidth.w10,
              InkWell(
                onTap: () {
                  comment();
                },
                child: Card(
                  color: AppColors.gray50,
                  elevation: 1,
                  child: Padding(
                    padding: XPadding.allSidePadding55,
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.comment,
                          height: 20.h,
                          width: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              XGapWidth.w10,
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: AppTextStyle.txtInterSemiBold14DarkGreen);
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(text),
    );
  }
}
