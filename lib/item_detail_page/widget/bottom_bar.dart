import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:team4_groupproject/drink.dart';
import 'package:team4_groupproject/item_detail_page/widget/bottom_bar_widget/counter_widget.dart';
import 'package:team4_groupproject/item_detail_page/widget/bottom_bar_widget/purchase_button.dart';
import 'package:team4_groupproject/number_format.dart';

class BottomBar extends StatelessWidget {
  final int quantity;
  final int totalPrice;
  final ValueChanged<int> onQuantityChanged;
  final Drink drink;

  const BottomBar({
    required this.quantity,
    required this.totalPrice,
    required this.onQuantityChanged,
    required this.drink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff674636),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CounterWidget(
              quantity: quantity,
              onQuantityChanged: onQuantityChanged,
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      top: 18,
                      left: 28,
                      child: Text(
                        'TOTAL',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                  Positioned(
                      bottom: 20,
                      right: 28,
                      child: Text(
                        '${numberFormat(totalPrice)}',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: PurchaseButton(
                productName: drink.name,
                quantity: quantity,
                drink: drink,
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
