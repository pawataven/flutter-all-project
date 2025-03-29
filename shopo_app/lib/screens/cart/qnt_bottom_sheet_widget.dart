import 'package:flutter/material.dart';
import 'package:shopo_app/widgets/subtitle_text.dart';

class QuantityBottomSheetWidget extends StatelessWidget {
  const QuantityBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30,),
        
        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 30,),
        
        Expanded(
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print("index ${index + 1}");
                },
                child: SubtitleTextWidget(
                  label: "${index + 1}",
                  // ถ้าต้องการปรับการจัดการขนาดหรือลักษณะเพิ่มเติม สามารถทำได้ที่นี่
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
