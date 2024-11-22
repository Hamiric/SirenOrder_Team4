import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget(
      {super.key,
      required this.imagePicker,
      required this.selectedImage,
      required this.imageSelected});

  final ImagePicker imagePicker;
  final XFile? selectedImage;
  final Function(XFile?) imageSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var image = await imagePicker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          imageSelected(image);
          print('이미지 선택');
        } else {
          print('선택하지 않음');
        }
      },
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: const Color(0xffFFF8E8),
          image: selectedImage != null
              ? DecorationImage(
                  image: FileImage(File(selectedImage!.path)),
                  fit: BoxFit.cover)
              : null,
        ),
        child: selectedImage == null
            ? const Center(
                child: Text(
                  'image',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            : null,
      ),
    );
  }
}
