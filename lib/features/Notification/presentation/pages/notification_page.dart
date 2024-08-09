import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gift_shop/core/utils/padding.dart';
import 'package:gift_shop/core/utils/sizedbox.dart';
import 'package:gift_shop/core/utils/textstyle.dart';
import 'package:gift_shop/core/utils/theme.dart';
import 'package:gift_shop/core/widget/appbar/custom_appbar.dart';
import 'package:flutter/cupertino.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBarCommon(
          title: 'Notifications',
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.whiteA700,
              ))),
      body: Padding(
        padding: XPadding.allSidePadding,
        child: Column(
          children: [
            XGapHeight.h20,
            Text(
              message.notification!.title.toString(),
              style: AppTextStyle.txtInterSemiBold14DarkGreen,
            ),
            XGapHeight.h5,
            Text(
              message.notification!.body.toString(),
              style: AppTextStyle.txtInterRegular12DarkGreen,
            ),
            XGapHeight.h5,
            Text(
              message.data.toString(),
              style: AppTextStyle.txtInterRegular12DarkGreen,
            )
          ],
        ),
      ),
    );
  }
}
