import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shopo_app/root/app_constant.dart';
import 'package:shopo_app/root/root_colors.dart';
import 'package:shopo_app/services/assets_manager.dart';
import 'package:shopo_app/widgets/app_name.dart';
import 'package:shopo_app/widgets/products/ctg_rouded_widget.dart';
import 'package:shopo_app/widgets/products/lastest_arrival_product.dart';
import 'package:shopo_app/widgets/title_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: AppNameTextWidget(),
        leading: Image.asset(AssetsManager.shoppingCart), // รุปโลโก้เเอพ
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.24,
                child: Swiper(
                  itemBuilder: (context, index) {
                    return Image.asset(AppConstants.bannersImages[index]);
                  },
          
                  itemCount: AppConstants.bannersImages.length,
                  autoplay: true,
                  pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: root_colors.lightScarffoldColors,
                      activeColor: root_colors.light1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const TitleTextWidget(label: "เพิ่มล่าสุด", fontSize: 22),
              SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const LatestArrivalProductWidget();
                  },
                ),
              ),
          
              const TitleTextWidget(label: "หมวดหมู่", fontSize: 22),
              const SizedBox(height: 10),
          
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true, // ป้องกัน overflow
                physics:
                    const NeverScrollableScrollPhysics(), // ปิดการเลื่อนของ GridView
                children: List.generate(AppConstants.categoriesList.length, (index){
          
                  return CategoryRoundedWidget(
                    image: AppConstants.categoriesList[index].images,
                    name: AppConstants.categoriesList[index].name,
                  );
                }), // ปิดวงเล็บให้ถูกต้อง
              ),
            ],
          ),
        ),
      ),
    );
  }
}
