import 'package:flutter/material.dart';
import 'package:shopo_app/widgets/title_text.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.white,
      child: TitleTextWidget(label: "Shoppoo", fontSize: 24, color: Colors.white,),
      );
  }
}
