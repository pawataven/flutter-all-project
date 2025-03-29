import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shopo_app/widgets/subtitle_text.dart';

class CustomListtile extends StatelessWidget {
  final String imagePath, text;
  final Function function;

  const CustomListtile({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      leading: Image.asset(
        imagePath,
        height: 30,
      ),
      title: SubtitleTextWidget(label: text),
      trailing: const Icon(IconlyLight.arrow_right_2),
    );
  }
}
