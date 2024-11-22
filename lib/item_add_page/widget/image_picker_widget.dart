import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xffFFF8E8),
      ),
      child: const Center(
        child: Text(
          'image',
          style: TextStyle(
            color: Colors.grey
          ),
        ),
      ),
    );
  }
}