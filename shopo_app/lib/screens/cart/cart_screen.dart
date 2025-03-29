import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shopo_app/screens/cart/card_widget.dart';
import 'package:shopo_app/screens/cart/cart_bottom_checkout.dart';
import 'package:shopo_app/services/assets_manager.dart';
import 'package:shopo_app/widgets/empty_widget.dart';
import 'package:shopo_app/widgets/title_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
          body: EmptyWidget(
            imagePath: AssetsManager.shoppingCart,
            title: "กาดของคุณว่างเปล่า",
            subtitle: "",
            buttonText: "ช็อปเลยตอนนี้",
          ),
        )
        : Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(IconlyLight.delete),
                color: Colors.red,
              ),
            ],
            title: TitleTextWidget(
              label: "สินค้าทั้งหมด 6 ชิ้น",
              fontSize: 22, 
              color: Colors.white,
            ),
            leading: Image.asset(AssetsManager.shoppingCart),
          ),
          body: ListView.builder(
            itemCount: 6, //จำนวนสินค้า
            itemBuilder: (context, index) {
              return const CartWidget();
            },
          ),
          bottomSheet: CartBottomCheckout(),
        );
  }
}
