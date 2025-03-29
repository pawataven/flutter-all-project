import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopo_app/root/root_colors.dart';

class PickImageWidget extends StatelessWidget {
  final XFile? pickedImage;
  final Function function;

  const PickImageWidget({super.key, this.pickedImage, required this.function});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child:
                pickedImage == null
                    ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                    )
                    : Image.file(File(pickedImage!.path), fit: BoxFit.fill),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            color: root_colors.light1,
            child: InkWell(
              splashColor: Colors.orange,
              borderRadius: BorderRadius.circular(20.0),
              onTap: () {
                function();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.camera_alt, size: 24, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
