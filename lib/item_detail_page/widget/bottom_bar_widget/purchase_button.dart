import 'package:flutter/material.dart';
import 'package:team4_groupproject/drink.dart';

class PurchaseButton extends StatelessWidget {
  final String productName;
  final int quantity;
  final Drink drink;

  const PurchaseButton({
    required this.productName,
    required this.quantity,
    required this.drink,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        '구매',
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFFF8E8),
        minimumSize: Size(60, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

      // ${상품명}을 ${구매 수량}개 구매하시겠습니까? 팝업
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    width: 230,
                    height: 45,
                    child: Center(
                      child: Text(
                        '$productName를\n$quantity개 구매하시겠습니까?',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // 팝업 닫기
                        },
                        child: Text(
                          '취소',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (drink.count + quantity > 100) {
                            Navigator.of(context).pop();
                            _overCountPopup(context, drink.count);
                          } else {
                            drink.count += quantity;
                            Navigator.of(context).pop(); // 현재 팝업 닫기
                            _completePopup(context); // 구매 완료 팝업
                          }
                        },
                        child: Text(
                          '확인',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            });
      },
    );
  }
}

// 구매 완료 팝업 메서드
void _completePopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              width: 230,
              height: 45,
              child: Center(
                child: Text(
                  '장바구니에 담겼습니다',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 구매완료 팝업 닫기
                },
                child: Text(
                  '확인',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.black),
                ),
              ),
            ),
          ]);
    },
  );
}

// 장바구니 개수 오버 팝업 메서드
void _overCountPopup(BuildContext context, int count) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              width: 250,
              height: 45,
              child: Center(
                child: Text(
                  '99개 이상은 구매하실 수 없습니다\n현재 장바구니 개수: $count',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  '확인',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.black),
                ),
              ),
            ),
          ]);
    },
  );
}
