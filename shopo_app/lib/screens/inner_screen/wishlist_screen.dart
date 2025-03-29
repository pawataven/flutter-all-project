import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shopo_app/services/assets_manager.dart';
import 'package:shopo_app/widgets/empty_widget.dart';
import 'package:shopo_app/widgets/title_text.dart';

import '../../widgets/products/product_widget.dart';

class WishlistScreen extends StatelessWidget {
  static const routName = "/WishlistScreen";
  const WishlistScreen({super.key});
  final bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
          body: EmptyWidget(
            imagePath: AssetsManager.bagWish,
            title: "Nothing in ur wishlist yet",
            subtitle:
                "Looks like your cart is empty add something and make me happy",
            buttonText: "Shop now",
          ),
        )
        : Scaffold(
          appBar: AppBar(
            title: const TitleTextWidget(label: "บันทึกไว้"),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AssetsManager.shoppingCart),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_forever_rounded),
                color: Colors.red,
              ),
            ],
          ),
          body: DynamicHeightGridView(
            itemCount: 220,
            builder: ((context, index) {
              return const ProductWidget(
                productId: "",
              );
            }),
            crossAxisCount: 2,
          ),
        );
  }
}
