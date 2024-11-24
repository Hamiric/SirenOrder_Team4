import 'package:flutter/material.dart';


class PurchaseButton extends StatelessWidget {
  final String productName = '초코 플랫 화이트';
  final int totalPrice;
  const PurchaseButton({required this.totalPrice});  

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
                  height: 20,
                  child: Center(
                    child: Text(
                      '$productName을\n$totalPrice개 구매하시겠습니까?',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();  // 팝업 닫기
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
                      Navigator.of(context).pop(); // 현재 팝업 닫기
                      _completePopup(context); // 구매 완료 팝업
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
            );
          }
        );
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
        content: Text('구매 완료'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // 구매완료 팝업 닫기
            }, 
            child: Text('확인'),
          ),
        ]
      );
    },
  );
}