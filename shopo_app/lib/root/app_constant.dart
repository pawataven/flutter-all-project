import 'package:shopo_app/models/category_model.dart';
import 'package:shopo_app/services/assets_manager.dart';

class AppConstants {
  static const String productImageUrl =
      "https://www.classicfootballshirts.co.uk/cdn-cgi/image/w=360,h=360,q=100,fit=pad,f=webp/pub/media/catalog/product/b/f/bf0d49b8266237510727e01ea2744c27c356f488aca9c35c958bd77c32d5bb93.jpeg";

  static List<String> bannersImages = [
    AssetsManager.banner1,
  ];

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
      id: "Phones",
      images: AssetsManager.mobiles,
      name: "โทรศัพมือถือ",
    ),
    CategoriesModel(
      id: "Laptops",
      images: AssetsManager.pc,
      name: "เเล็ปท็อป",
    ),
    CategoriesModel(
      id: "Electronics",
      images: AssetsManager.electronics,
      name: "เครื่องไฟฟ้า",
    ),
    CategoriesModel(
      id: "Watches",
      images: AssetsManager.watch,
      name: "นาฬิกา",
    ),
  ];
}
