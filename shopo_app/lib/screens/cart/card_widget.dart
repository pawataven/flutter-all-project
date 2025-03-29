import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shopo_app/root/app_constant.dart';
import 'package:shopo_app/root/root_colors.dart';
import 'package:shopo_app/screens/cart/qnt_bottom_sheet_widget.dart';
import 'package:shopo_app/widgets/subtitle_text.dart';
import 'package:shopo_app/widgets/title_text.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    image: NetworkImage(AppConstants.productImageUrl), 
                    height: size.height * 0.1,
                    width: size.height * 0.1,
                  ),
                ),
              const SizedBox(width: 10),
              IntrinsicWidth(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: TitleTextWidget(
                            label: "เสื้อบาซ่า ปี 1999" * 10,
                            maxLines: 2,
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              ),
                            ),

                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                IconlyLight.heart,
                                color: Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SubtitleTextWidget(
                          label: "฿ 15000",
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                        const Spacer(),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: const BorderSide(
                              width: 2,
                              color: root_colors.light1,
                            ),
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                )
                              ),
                              context: context,
                              builder: (context) {
                                return const QuantityBottomSheetWidget();
                              },
                            );
                          },
                          icon: Icon(IconlyLight.arrow_down),
                          label: Text("ชิ้น:"),
                        ),
                      ],
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
