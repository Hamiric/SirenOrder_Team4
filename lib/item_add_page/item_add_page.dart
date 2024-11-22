import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team4_groupproject/item_add_page/widget/dish_info_widget.dart';
import 'package:team4_groupproject/item_add_page/widget/image_picker_widget.dart';
import 'package:team4_groupproject/item_add_page/widget/register_button.dart';

class ItemAddPage extends StatefulWidget {
  const ItemAddPage({super.key});

  @override
  State<ItemAddPage> createState() => _ItemAddPageState();
}

class _ItemAddPageState extends State<ItemAddPage> {
  final ImagePicker imagePicker = ImagePicker();
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Siren'),
      ),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              ImagePickerWidget(
                imagePicker: imagePicker,
                selectedImage: selectedImage,
                imageSelected: (image) {
                  setState(() {
                    selectedImage = image;
                  });
                },
              ),
              const DishInfoWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const RegisterButton(),
    );
  }
}
