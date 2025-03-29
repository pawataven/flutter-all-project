import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:shopo_app/providers/theme_provider.dart';
import 'package:shopo_app/root/root_colors.dart';
import 'package:shopo_app/screens/inner_screen/viewed_recently.dart';
import 'package:shopo_app/screens/inner_screen/wishlist_screen.dart';
import 'package:shopo_app/services/assets_manager.dart';
import 'package:shopo_app/widgets/app_name.dart';
import 'package:shopo_app/widgets/custom_listTile.dart';
import 'package:shopo_app/widgets/subtitle_text.dart';
import 'package:shopo_app/widgets/title_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: AppNameTextWidget(),
        leading: Image.asset(AssetsManager.shoppingCart), // รุปโลโก้เเอพ
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.surface,
                      width: 2,
                    ),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://scontent.fbkk28-1.fna.fbcdn.net/v/t39.30808-6/471645873_3679657458992314_4623879149327976534_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeECd-Dx_OMorKvbCy920sdrNWL4ee9-7Pw1Yvh5737s_ELv1q3m78Wkd7SYP3sqx5cfN0hrRCHIn1i2OokrKnjh&_nc_ohc=sjF4JJlNjlQQ7kNvgEAKnw1&_nc_oc=AdhWXgs_xdUWswg4PDpT_i7eEXdpj-hpPHkiP2R-N7izpuIrwFYcKj7o-v5E1qIpb5Q&_nc_zt=23&_nc_ht=scontent.fbkk28-1.fna&_nc_gid=AQrGMUE1W_SRHbj85bnuXaY&oh=00_AYCavjsa18SiCU2frB7em4u-te50-TyYee9lqmcW_AoKbw&oe=67BF2A91",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                SizedBox(width: 10),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleTextWidget(label: "Pawat Wantrong"),
                    SubtitleTextWidget(label: "pawatwantrong@gmail.com"),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextWidget(label: "ทั่วไป", fontSize: 22),
                CustomListtile(
                  imagePath: AssetsManager.orderSvg,
                  text: "การสั่งซื้อของคุณ",
                  function: () {},
                ),

                CustomListtile(
                  imagePath: AssetsManager.wishlistSvg,
                  text: "ที่บันทึกไว้",
                  function: () {
                    Navigator.pushNamed(context, WishlistScreen.routName);
                  },
                ),

                CustomListtile(
                  imagePath: AssetsManager.recent,
                  text: "ล่าสุด",
                  function: () {
                    Navigator.pushNamed(context, RecentlyViewedScreen.routName);
                  },
                ),

                CustomListtile(
                  imagePath: AssetsManager.address,
                  text: "ที่อยู่การจัดส่ง",
                  function: () {},
                ),
                Divider(thickness: 3),
                SizedBox(height: 10),
                TitleTextWidget(label: "การตั้งค่า", fontSize: 22),

                SwitchListTile(
                  title: Text(
                    themeProvider.getIsDarktheme ? "Dark Mode" : "light Mode",
                  ),

                  value: themeProvider.getIsDarktheme,
                  onChanged: (value) {
                    themeProvider.setDataTheme(themevalue: value);
                  },
                ),

                Divider(thickness: 3),
                SizedBox(height: 10),

                Center(
                  //ปุ่มเข้าสู่ระบบ
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: root_colors.light2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(IconlyBold.login, color: Colors.white),
                    label: Text(
                      "เข้าสู่ระบบ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
