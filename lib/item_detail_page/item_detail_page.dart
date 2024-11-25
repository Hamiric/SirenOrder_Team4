import 'package:flutter/material.dart';
import 'package:team4_groupproject/item_detail_page/widget/bottom_bar.dart';
import 'package:team4_groupproject/item_detail_page/widget/menu_script.dart';
import 'package:team4_groupproject/item_detail_page/widget/siren_app_bar.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({super.key});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int _quantity = 1; // 초기 수량
  int _itemPrice = 5000; // 화면에 보여지는 단가
  int get _totalPrice => _quantity * _itemPrice; // 총 가격 계산 (getter)

  void _changeQuantity(int newQuantity) {
    setState(() {
      _quantity = newQuantity;
    });
  }

  bool isStarred = false;

  void touchStar() {
    setState(() {
      isStarred = !isStarred;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SirenAppBar(
        actionIcon: Icons.share_outlined,
        onAcionPressed: () {},
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Image.asset('assets/menu.jpg'),
                SizedBox(height: 35),
                MenuScript(
                  isStarred: isStarred,
                  onStarTouch: touchStar,
                ),
              ],
            )),
          BottomBar(
            quantity: _quantity,
            totalPrice: _totalPrice,
            onQuantityChanged: _changeQuantity,
          ),
        ],
      ),
    );
  }
}
