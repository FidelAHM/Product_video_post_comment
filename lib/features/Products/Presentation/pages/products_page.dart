import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gift_shop/features/Products/Presentation/Manager/bloc/products_bloc.dart';
import 'package:gift_shop/core/routes.dart';

import 'package:gift_shop/core/utils/padding.dart';
import 'package:gift_shop/core/utils/sizedbox.dart';
import 'package:gift_shop/core/utils/theme.dart';
import 'package:gift_shop/core/widget/appbar/custom_appbar.dart';
import 'package:shimmer/shimmer.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // List<ProductsModel> itemList = [];
  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(LoadProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
          title: 'Products',
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.whiteA700),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: XPadding.allSidePadding5,
          child: Column(
            children: [
              BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsDataLoadedState) {
                    return Column(
                      children: [
                        XGapHeight.h10,
                        Container(
                          height: 600.h,
                          child: ListView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final products = state.products[index];

                              return Padding(
                                padding: XPadding.allSidePadding5,
                                child: Card(
                                  color: AppColors.gray50,
                                  elevation: 0,
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, AppRoutes.favouriteProduct,
                                          arguments: products);
                                    },
                                    leading: Image.network(products.thumbnail),
                                    title: Text(products.title),
                                    subtitle: Text(products.price.toString()),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColors.darkGreen,
                                    ),
                                  ),
                                ),
                              );
                            },
                            scrollDirection: Axis.vertical,
                            padding: XPadding.onlyBottom10,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Shimmer.fromColors(
                        baseColor: AppColors.lightGrey,
                        highlightColor: AppColors.lightBlue100,
                        child: Padding(
                          padding: XPadding.allSidePadding,
                          child: Container(
                            height: 50.h,
                            width: 300.w,
                            color: AppColors.lightBlue,
                          ),
                        ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
