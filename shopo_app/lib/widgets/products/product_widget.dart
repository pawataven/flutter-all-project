import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shopo_app/root/root_colors.dart';
import 'package:shopo_app/screens/inner_screen/product_detail.dart';
import 'package:shopo_app/widgets/products/heart_btn_widget.dart';
import 'package:shopo_app/widgets/subtitle_text.dart';
import 'package:shopo_app/widgets/title_text.dart';

class ProductWidget extends StatefulWidget {
  final String productId;

  const ProductWidget({super.key, required this.productId});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    // final productsProvider = Provider.of<ProductsProvider>(context);
    // final getCurrentProduct = productsProvider.findByProdId(widget.productId);
    
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () async{
          await Navigator.pushNamed(context, ProductDetail.routeName,);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image(
                image: NetworkImage(
                  "https://5.imimg.com/data5/SELLER/Default/2024/2/393695399/SR/LP/KS/193784714/sports-jersey.jpg",
                  
                ), // ใช้ NetworkImage
                fit: BoxFit.contain,
                height: size.height * 0.22, //ขนาดรูป ช่องค้นหา
                width: double.infinity,
              ),
            ),
            Row(
              children: [
                Flexible(
                  flex: 5,
                  child: TitleTextWidget(
                    label: "เสื้อใหม่",
                    maxLines: 2,
                    fontSize: 18,
                  ),
                ),
                Flexible(flex: 2, child: HeartBtnWidget()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubtitleTextWidget(
                  label: "฿ 5000",
                  color: Colors.orange,
                  fontWeight: FontWeight.w400,
                ),
                Material(
                  borderRadius: BorderRadius.circular(50.0),
                  color: root_colors.light2,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(IconlyBold.bag_2),
                    color: root_colors.lightScarffoldColors,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
