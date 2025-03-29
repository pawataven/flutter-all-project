import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail'),),
      body: const Center(child: Column(children: [
       SizedBox(height: 10,),
       Text('Product Detail Page'),
       
      ],),),
    );
  }
}