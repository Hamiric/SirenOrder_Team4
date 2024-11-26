import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team4_groupproject/item_add_page/widget/dish_info_widget.dart';
import 'package:team4_groupproject/item_add_page/widget/image_picker_widget.dart';
import 'package:team4_groupproject/item_add_page/widget/register_button.dart';

import '../item_detail_page/widget/siren_app_bar.dart';

class ItemAddPage extends StatefulWidget {
  const ItemAddPage({super.key});

  @override
  State<ItemAddPage> createState() => _ItemAddPageState();
}

class _ItemAddPageState extends State<ItemAddPage> {
  final ImagePicker imagePicker = ImagePicker();
  XFile? selectedImage;

  final menuNameController = TextEditingController();
  final menuSubNameController = TextEditingController();
  final menuPriceController = TextEditingController();
  final menuDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SirenAppBar(),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    // 이미지 피커 위젯
                    ImagePickerWidget(
                      imagePicker: imagePicker,
                      selectedImage: selectedImage,
                      imageSelected: (image) {
                        setState(() {
                          selectedImage = image;
                        });
                      },
                    ),
                    // Text 입력 필드
                    DishInfoWidget(
                      menuNameController: menuNameController,
                      menuSubNameController: menuSubNameController,
                      menuPriceController: menuPriceController,
                      menuDescriptionController: menuDescriptionController,
                    ),
                  ],
                ),
              ),
              RegisterButton(
                menuNameController: menuNameController,
                menuSubNameController: menuSubNameController,
                menuPriceController: menuPriceController,
                menuDescriptionController: menuDescriptionController,
                selectedImage: selectedImage,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    menuNameController.dispose();
    menuSubNameController.dispose();
    menuPriceController.dispose();
    menuDescriptionController.dispose();
    super.dispose();
  }
}
