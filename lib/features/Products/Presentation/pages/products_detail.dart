import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gift_shop/core/routes.dart';
import 'package:gift_shop/features/Products/Datasource/models/products_model.dart';
import 'package:gift_shop/features/Products/Presentation/widgets/content.dart';
import 'package:gift_shop/core/utils/image_constant.dart';
import 'package:gift_shop/core/utils/padding.dart';
import 'package:gift_shop/core/utils/sizedbox.dart';
import 'package:gift_shop/core/utils/textstyle.dart';
import 'package:gift_shop/core/utils/theme.dart';

class FavouriteProducts extends StatefulWidget {
  const FavouriteProducts({
    super.key,
  });

  @override
  State<FavouriteProducts> createState() => _FavouriteProductsState();
}

class _FavouriteProductsState extends State<FavouriteProducts> {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as ProductsModel;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(child: Image.network(item.thumbnail)),
                XGapHeight.h10,
                Padding(
                  padding: XPadding.allTopAndLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.darkGreen,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: XPadding.allSidePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTextStyle.txtInterSemiBold30DarkGreen,
                  ),
                  XGapHeight.h10,
                  RichText(
                    text: TextSpan(
                        text: item.price.toString(),
                        style: AppTextStyle.txtInterSemiBold30DarkGreen,
                        children: [
                          TextSpan(
                              text: ' ETB',
                              style: AppTextStyle.txtInterRegular12DarkGreen)
                        ]),
                  ),
                  XGapHeight.h5,
                  Divider(color: AppColors.lightBlue100, thickness: 1),
                  Content(
                      title: 'Description',
                      image: AppImages.content,
                      widget: item.description ?? 'No description'),
                  Content(
                      title: 'Rating',
                      image: AppImages.star,
                      widget: item.rating.toString()),
                  XGapHeight.h10,
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.posts);
                        },
                        child: Text(
                          "Go to Posts",
                          style: AppTextStyle.txtInterSemiBold12DarkGreen,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
