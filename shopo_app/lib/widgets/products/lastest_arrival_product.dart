import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shopo_app/root/app_constant.dart';
import 'package:shopo_app/screens/inner_screen/product_detail.dart';
import 'package:shopo_app/widgets/subtitle_text.dart';

class LatestArrivalProductWidget extends StatelessWidget {
  const LatestArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async{
          Navigator.pushNamed(context, ProductDetail.routeName);
        },
        child: SizedBox(
          width: size.width * 0.45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    AppConstants.productImageUrl, // โหลดรูปจาก URL
                    width: size.width * 0.20,
                    height: size.width * 0.20,
                  ),
                ),
              ),

              const SizedBox(width: 7),

              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title" * 10,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(IconlyLight.heart),
                          ),

                          IconButton(
                            onPressed: () {},
                            icon: Icon(IconlyLight.bag,
                            size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const FittedBox(
                      child: SubtitleTextWidget(label: "฿ 1200", color: Colors.orange,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}