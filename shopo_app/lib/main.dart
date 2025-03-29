import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopo_app/providers/theme_provider.dart';
import 'package:shopo_app/root/theme_data.dart';
import 'package:shopo_app/root_screen.dart';
import 'package:shopo_app/screens/auth/login.dart';
import 'package:shopo_app/screens/auth/register.dart';
import 'package:shopo_app/screens/inner_screen/product_detail.dart';
import 'package:shopo_app/screens/inner_screen/viewed_recently.dart';
import 'package:shopo_app/screens/inner_screen/wishlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: "flutter demo app",
            theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarktheme,
              context: context,
            ),
            debugShowCheckedModeBanner: false,
            // home: LoginScreen(), //เข้าหน้า  Login register
            home: RootScreen(), //หน้าหลัก

            routes: {
              ProductDetail.routeName: (context) => const ProductDetail(),
              WishlistScreen.routName: (context) => const WishlistScreen(),
              RecentlyViewedScreen.routName:
                  (context) => const RecentlyViewedScreen(),
              RegisterScreen.routeName:
                  (context) => const RegisterScreen(),
            },
          );
        },
      ),
    );
  }
}