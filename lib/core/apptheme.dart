import 'package:flutter/material.dart';
import 'package:gift_shop/core/utils/theme.dart';
import 'package:flutter/cupertino.dart';
class AppTheme {
  static _border([Color color = Colors.grey]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 2
      )
      );

  static final appBackgroundTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.whiteA700,
      // inputDecorationTheme: InputDecorationTheme(
      //   contentPadding: XPadding.allSidePadding,
      //   enabledBorder: _border(),
      //   focusedBorder: _border(AppColors.lightBlue900)

      // )
      );

  // static final darkThemeMode = ThemeData.dark().copyWith(
  //   scaffoldBackgroundColor: AppPallete.backgroundColor,
  //   inputDecorationTheme: InputDecorationTheme(
  //       contentPadding: EdgeInsets.all(20),
  //       enabledBorder: _border(),
  //       focusedBorder: _border(AppPallete.gradient2)),
  // );
}
