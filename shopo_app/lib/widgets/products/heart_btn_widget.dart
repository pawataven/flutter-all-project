import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HeartBtnWidget extends StatefulWidget {
  final double size;
  final Color colors;
  const HeartBtnWidget({
    super.key,
    this.size = 22,
    this.colors = Colors.transparent,
  });

  @override
  State<HeartBtnWidget> createState() => _HeartBtnWidgetState();
}

class _HeartBtnWidgetState extends State<HeartBtnWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: 
      BoxShape.circle, 
      color: widget.colors
      ),
      child: IconButton(
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
          ),

        onPressed: () {},
        icon: Icon(
          IconlyLight.heart, 
        size: widget.size
        ),
      ),
    );
  }
}
