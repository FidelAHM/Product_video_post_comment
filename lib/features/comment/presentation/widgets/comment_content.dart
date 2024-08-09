import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gift_shop/core/utils/image_constant.dart';
import 'package:gift_shop/core/utils/padding.dart';
import 'package:gift_shop/core/utils/sizedbox.dart';
import 'package:gift_shop/core/utils/textstyle.dart';
import 'package:gift_shop/core/utils/theme.dart';
import 'package:flutter/cupertino.dart';

class CommentContent extends StatelessWidget {
  final String userName;
  final String fullName;
  final String like;
  final String body;
  CommentContent(
      {required this.fullName, required this.like, required this.userName, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: XPadding.allSidePadding55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fullName,
            style: AppTextStyle.txtInterSemiBold12DarkGreen,
          ),
          Text(
            userName,
            style: AppTextStyle.txtInterRegular12Grey,
          ),
          XGapHeight.h5,
          _buildParagraph(body),
          XGapHeight.h5,
          Row(
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
            ],
          ),
        ],
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
