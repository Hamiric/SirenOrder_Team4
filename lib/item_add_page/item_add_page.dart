import 'package:flutter/material.dart';
import 'package:team4_groupproject/item_add_page/widget/dish_info_widget.dart';
import 'package:team4_groupproject/item_add_page/widget/image_picker_widget.dart';
import 'package:team4_groupproject/item_add_page/widget/register_button.dart';

class ItemAddPage extends StatelessWidget {
  const ItemAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Siren'),
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ImagePickerWidget(),
            DishInfoWidget(),
          ],
        ),
      ),
      floatingActionButton: RegisterButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}