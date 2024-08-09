import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:gift_shop/features/Dashboard/presentation/pages/dashboard.dart';
import 'package:gift_shop/core/utils/image_constant.dart';
import 'package:gift_shop/core/utils/theme.dart';
import 'package:flutter/cupertino.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
   return AnimatedSplashScreen(
      splash: AppImages.logo,
      nextScreen:  Dashboard(),
      backgroundColor: AppColors.whiteA700,
      duration: 3000,
    );
  }
}