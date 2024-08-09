import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gift_shop/core/utils/image_constant.dart';
import 'package:gift_shop/core/utils/padding.dart';
import 'package:gift_shop/core/utils/textstyle.dart';
import 'package:gift_shop/features/Dashboard/presentation/Widgets/dashboard_card.dart';
import 'package:gift_shop/core/routes.dart';
import 'package:gift_shop/core/utils/sizedbox.dart';
import 'package:gift_shop/core/utils/theme.dart';
import 'package:gift_shop/core/widget/appbar/custom_appbar.dart';
import 'package:flutter/cupertino.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
        title: 'Home',
        leading: Icon(
          Icons.home,
          color: AppColors.whiteA700,
        ),
      ),
      body: Padding(
        padding: XPadding.allSidePadding5,
        child: SingleChildScrollView(
          child: Column(children: [
            XGapHeight.h15,
            DashboardCard(
              name: 'Products',
              subtitle: 'Please Click here to see products',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.products);
              },
            ),
            XGapHeight.h20,
            DashboardCard(
              name: 'Videos',
              subtitle: 'Please Click here to see videos',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.videoPlayer);
              },
            ),
            XGapHeight.h20,
            DashboardCard(
              name: 'Posts',
              subtitle: 'Please Click here to see posts',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.posts);
              },
            ),
            XGapHeight.h50,
            CircleAvatar(
              backgroundColor: AppColors.whiteA700,
              radius: 40.r,
              child: Image.asset(AppImages.welcome),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 10.r,
            backgroundImage: AssetImage(
              AppImages.git,
            ),
          ),
          XGapWidth.w5,
          Text('Fidel AHM', style: AppTextStyle.txtInterSemiBold12DarkGreen)
        ],
      ),
    );
  }
}
