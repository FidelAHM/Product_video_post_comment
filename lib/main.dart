import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gift_shop/features/Notification/Data_source/notification_api.dart';
import 'package:gift_shop/features/Products/Presentation/Manager/bloc/products_bloc.dart';
import 'package:gift_shop/core/navigator_key.dart';
import 'package:gift_shop/core/routes.dart';
import 'package:gift_shop/features/comment/presentation/Manager/bloc/comment_bloc.dart';
import 'package:gift_shop/features/posts/presentation/manager/bloc/post_bloc.dart';
import 'package:gift_shop/firebase_options.dart';
import 'package:gift_shop/features/videos/presentation/manager/bloc/video_player_bloc.dart';
import 'package:gift_shop/features/videos/presentation/video_detail.dart/bloc/video_detail_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAPI().initNotifications();
  runApp(const MyApp());
}

final storage = new FlutterSecureStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ProductsBloc()),
            BlocProvider(create: (context) => VideoPlayerBloc()),
            BlocProvider(create: (context) => VideoDetailBloc()),
            BlocProvider(create: (context) => PostBloc()),
            BlocProvider(create: (context) => CommentBloc()),

          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splashScreen,
            routes: AppRoutes.routes,
          ),
        );
      },
    );
  }
}
