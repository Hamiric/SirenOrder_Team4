import 'package:flutter/material.dart';
import 'package:team4_groupproject/item_detail_page/widget/bottom_bar.dart';
import 'package:team4_groupproject/item_detail_page/widget/menu_script.dart';
import 'package:team4_groupproject/item_detail_page/widget/siren_app_bar.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SirenAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Image.asset('assets/menu.jpg'),
                SizedBox(height: 41),
                MenuScript(),
              ],
            )),
          BottomBar(),
        ],
      ),
    );
  }
}
