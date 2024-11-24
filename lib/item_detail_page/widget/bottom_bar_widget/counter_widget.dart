import 'package:flutter/material.dart';


// -, +로 구매수량 조절
class CounterWidget extends StatelessWidget{
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const CounterWidget({
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 126,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffFFF8E8),
        ),
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                onPressed: () {
                  // 구매수량 >0 예외처리
                  if (quantity > 1) onQuantityChanged(quantity - 1);
                },
                icon: Icon(Icons.remove),
              ),
            ),
            Expanded(
              child: Text(
                '$quantity',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  // 구매 수량 < 100 예외처리
                  if (quantity < 100) onQuantityChanged(quantity + 1);
                },
                icon: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

