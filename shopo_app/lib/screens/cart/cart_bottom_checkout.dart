import 'package:flutter/material.dart';
import 'package:shopo_app/root/root_colors.dart';
import 'package:shopo_app/widgets/subtitle_text.dart';
import 'package:shopo_app/widgets/title_text.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(width: 1, color: root_colors.black),
        ),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 30,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: TitleTextWidget(label: "สินค้าทั้งหมด 6 ชิ้น"),
                    ),
                    SubtitleTextWidget(label: "฿ 15000", color: Colors.orange),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: root_colors.light2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("ยืนยันชำระเงิน", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
