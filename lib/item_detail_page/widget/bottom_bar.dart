
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:team4_groupproject/item_detail_page/widget/bottom_bar_widget/counter_widget.dart';
import 'package:team4_groupproject/item_detail_page/widget/bottom_bar_widget/purchase_button.dart';

class BottomBar extends StatelessWidget {
  final int quantity;
  final int totalPrice;
  final ValueChanged<int> onQuantityChanged;
  
  const BottomBar({
    required this.quantity,
    required this.totalPrice,
    required this.onQuantityChanged,
  });




  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff674636),
      ),
      child: Row(
        children: [
          CounterWidget(
            quantity: quantity,
            onQuantityChanged: onQuantityChanged,
          ),
          Column(
            children: [
              Text('TOTAL'),
              Text('$totalPrice원'),
            ],
          ),
          PurchaseButton(
            totalPrice: totalPrice,
          ),
        ],
      ),
    ); 
  }
}






