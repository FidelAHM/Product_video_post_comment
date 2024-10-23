import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gift_shop/core/utils/image_constant.dart';
import 'package:gift_shop/core/utils/padding.dart';
import 'package:gift_shop/core/utils/sizedbox.dart';
import 'package:gift_shop/core/utils/textstyle.dart';
import 'package:gift_shop/core/utils/theme.dart';

class DashboardCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final Function onTap;

  const DashboardCard(
      {required this.name, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 5,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              padding: XPadding.allSidePadding,
              height: 100.h,
              width: 350.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.darkGreen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XGapHeight.h20,
                  Center(
                    child: Text(name,
                        style: AppTextStyle
                            .whiteboldtxtInterRegular18Lightblue900),
                  ),
                  XGapHeight.h10,
                  Center(
                    child: Text(subtitle,
                        style: AppTextStyle
                            .whiteboldtxtInterSemiBold12Lightblue900),
                  ),
                ],
              ),
            ),
            Image.asset(
                fit: BoxFit.cover,
                height: 100.h,
                width: 100.w,
                AppImages.background_image)
          ],
        ),
      ),
    );
  }
}
