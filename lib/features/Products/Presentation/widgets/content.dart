import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gift_shop/core/utils/textstyle.dart';
import 'package:flutter/cupertino.dart';

class Content extends StatelessWidget {
  final String image;
  final String title;
  final String widget;

  const Content(
      {required this.image, required this.widget, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(
          image,
          height: 20.h,
          width: 20.h,
        ),
        title: Text(
          title,
          style: AppTextStyle.txtInterSemiBold14DarkGreen,
        ),
        subtitle: Text(
          widget,
          style: AppTextStyle.txtPoppinsRegular12Black900,
        ));
  }
}
