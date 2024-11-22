import 'package:flutter/material.dart';
import 'package:team4_groupproject/item_detail_page/widget/bottom_bar.dart';
import 'package:team4_groupproject/item_detail_page/widget/menu_script.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.only(top: 17),
          child: AppBar(
              backgroundColor: Colors.transparent,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, color: Colors.black),
                    onPressed: () {},
                  ),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'S',
                        style: TextStyle(
                          color: Color(0xFFAAB396),
                          fontSize: 32,
                        ),
                      ),
                      TextSpan(
                        text: 'iren',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                        ),
                      ),
                    ]),
                  ),
                  IconButton(
                    icon: const Icon(Icons.share_outlined, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              )),
        ),
      ),
      body: Column(
        children: [
          Image.asset('assets/menu.jpg'),
          MenuScript(),
          BottomBar(),
        ],
      ),
    );
  }
}
