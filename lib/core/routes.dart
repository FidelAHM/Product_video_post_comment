
import 'package:flutter/material.dart';
import 'package:gift_shop/features/Notification/presentation/pages/notification_page.dart';
import 'package:gift_shop/features/Products/Presentation/pages/products_detail.dart';
import 'package:gift_shop/features/Products/Presentation/pages/products_page.dart';
import 'package:gift_shop/features/comment/presentation/pages/comment_page.dart';
import 'package:gift_shop/features/posts/presentation/pages/posts.dart';
import 'package:gift_shop/features/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:gift_shop/features/videos/presentation/pages/video.dart';
import 'package:gift_shop/features/videos/presentation/pages/video_detail.dart';
import 'package:gift_shop/features/videos/presentation/pages/video_player.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String products = '/products';
  static const String favouriteProduct = '/favourite_product';
  static const String videoPlayer = '/video_player';
  static const String videoDetail = '/video_detail';
  static const String videoPlayerScreen = '/video_player_screen';
  static const String notificationPage = '/notification_page';
  static const String posts = '/posts';
   static const String comments = '/comments';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    products: (context) => const Products(),
    favouriteProduct: (context) => const FavouriteProducts(),
    videoPlayer: (context) => const VideoPlayer(),
    videoDetail: (context) => const VideoDetail(),
    videoPlayerScreen: (context) => VideoPlayerScreen(),
    posts: (context) => Posts(),
    comments: (context) => Comments(),
    notificationPage : (context) => NotificationPage(),
  };
}
