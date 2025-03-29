import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shopo_app/root/root_colors.dart';
import 'package:shopo_app/widgets/app_name.dart';
import 'package:shopo_app/widgets/products/heart_btn_widget.dart';
import 'package:shopo_app/widgets/subtitle_text.dart';
import 'package:shopo_app/widgets/title_text.dart';

class ProductDetail extends StatefulWidget {
  static const routeName = "/ProductDetails";

  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final productsProvider = Provider.of<ProductsProvider>(context);
    final productId = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// รูปสินค้า
            Image.network(
              "https://5.imimg.com/data5/SELLER/Default/2024/2/393695399/SR/LP/KS/193784714/sports-jersey.jpg",
              height: size.height * 0.38,
              width: double.infinity,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 10),

            /// รายละเอียดสินค้า
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // จัดข้อความชิดซ้าย
                children: [
                  /// ชื่อสินค้า + ราคา
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// ชื่อสินค้า
                      Expanded(
                        child: Text(
                          "เสื้อกีฬาพิมพ์ลายสำเร็จรูป", 
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 10),

                      /// ราคา
                      SubtitleTextWidget(
                        label: "฿ 10000", 
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// ปุ่มถูกใจ และ ปุ่มเพิ่มเข้าตะกร้า
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /// ปุ่มหัวใจ
                      HeartBtnWidget(colors: root_colors.light2),

                      const SizedBox(width: 10),

                      /// ปุ่มเพิ่มเข้าตะกร้า
                      Expanded(
                        child: SizedBox(
                          height: kBottomNavigationBarHeight - 10,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: root_colors.light1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              IconlyLight.bag,
                              color: Colors.white,
                            ),
                            label: const Text(
                              "เพิ่มเข้าตะกร้า",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [TitleTextWidget(label: "รายละเอียดสินค้า")],
                  ),
                  const SizedBox(height: 25),
                  SubtitleTextWidget(
                    label: "เสื้อพิมพ์ลาย ที่ผลิตด้วยผ้าเม็ดข้าวสาร จะมีรูระบายอากาศเป็นทรงรี รูปทรงคล้ายกับตัวเม็ดข้าวซึ่งช่วยในการระบายอากาศ เป็นพิเศษ ",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
