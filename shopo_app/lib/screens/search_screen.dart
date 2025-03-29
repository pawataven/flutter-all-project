import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shopo_app/services/assets_manager.dart';
import 'package:shopo_app/widgets/title_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;
  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TitleTextWidget(
            label: "ค้นหาสินค้า",
            fontSize: 24,
            color: Colors.white,
          ),
          leading: Image.asset(AssetsManager.shoppingCart),
          flexibleSpace: Padding(padding: const EdgeInsets.all(8.0)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: searchTextController,
                decoration: InputDecoration(
                  prefixIcon: Icon(IconlyLight.search, color: Colors.orange),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        searchTextController.clear();
                        FocusScope.of(context).unfocus();
                      });
                    },
                    icon: const Icon(IconlyLight.send),
                    color: Colors.orange,
                  ),
                ),

                onFieldSubmitted: (value) {
                  print(searchTextController.text);
                },
              ),


            ],
          ),
        ),
      ),
    );
  }
}
