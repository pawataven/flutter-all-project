import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shopo_app/services/assets_manager.dart';
import 'package:shopo_app/widgets/empty_widget.dart';
import 'package:shopo_app/widgets/title_text.dart';

import '../../widgets/products/product_widget.dart';

class RecentlyViewedScreen extends StatelessWidget {
  static const routName = "/RecentlyViewedScreen";
  
  const RecentlyViewedScreen({super.key});
  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
          body: EmptyWidget(
            imagePath: AssetsManager.bagWish,
            title: "คุณยังไม่ได้เข้าชมสินค้าเลย น่าเศร้าจัง",
            subtitle:
                "เยี่ยมชมสินค้าเลย",
            buttonText: "กลับหน้าหลัก",
          ),
        )
        : Scaffold(
          appBar: AppBar(
            title: const TitleTextWidget(label: "เข้าชมล่าสุด"),
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
