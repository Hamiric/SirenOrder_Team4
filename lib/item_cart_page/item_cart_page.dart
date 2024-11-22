import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team4_groupproject/drink.dart';

// 테스트용
Drink d1 = Drink(
  name: '초코 플랫 화이트',
  code: 'Choco Flat White',
  img: 'assets/images/coffee.jpg',
  description: '',
  price: 5000,
  count: 1,
  isFavorite: false,
);
Drink d2 = Drink(
  name: '1234',
  code: '222',
  img: 'assets/images/coffee.jpg',
  description: '',
  price: 1000,
  count: 1,
  isFavorite: false,
);
Drink d3 = Drink(
  name: 'asdf',
  code: '',
  img: 'asdf',
  description: '',
  price: 2000,
  count: 1,
  isFavorite: false,
);
Drink d4 = Drink(
  name: '커피커피',
  code: '',
  img: 'assets/images/coffee.jpg',
  description: '',
  price: 4000,
  count: 1,
  isFavorite: false,
);
List<Drink> dList = [d1, d2, d3, d4];
// List<Drink> dList = [];

class ItemCartPage extends StatefulWidget {
  const ItemCartPage({super.key});

  @override
  State<ItemCartPage> createState() => _ItemCartPageState();
}

class _ItemCartPageState extends State<ItemCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('장바구니'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: dList.isEmpty
                  ? Center(
                      child: Text('장바구니가 비었습니다.'),
                    )
                  : ListView(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      children: List.generate(dList.length, (i) {
                        return itemRow(dList[i], i);
                      }),
                    ),
            ),
            Container(
              width: double.infinity,
              height: 84,
              child: ElevatedButton(
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                            title: Text('data'),
                            content: Text('data'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text(
                                  '확인',
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ]);
                      });
                },
                child: Text(
                  '구매하기',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF674636),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemRow(Drink drink, int i) {
    return Container(
      width: double.infinity,
      height: 112,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color(0xFFAAB396),
        width: 1,
      ))),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 16),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1, color: Color(0xFFAAB396))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              // 이미지 예외처리 필요
              child: Image.asset(
                '${drink.img}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 80,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${drink.name}'),
                  Text(
                    '${drink.code}',
                    style: TextStyle(
                      color: Color(0xFFAAB396),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // 1 이하로 떨어지지 않게 처리 필요
                            drink.count--;
                          });
                        },
                        child: Icon(Icons.remove),
                      ),
                      SizedBox(
                        width: 20,
                        child: Center(child: Text('${drink.count}')),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // 99 이상으로 올라가지 않게 처리 필요
                            drink.count++;
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                              title: Text('삭제하시겠습니까?'),
                              actions: [
                                CupertinoDialogAction(
                                  child: const Text(
                                    '삭제',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: const Text('확인'),
                                  onPressed: () {
                                    setState(() {
                                      try {
                                        dList.removeAt(i);
                                        Navigator.of(context).pop();
                                      } catch (e) {
                                        print("오류 발생: $e");
                                      }
                                    });
                                  },
                                )
                              ]);
                        });
                  },
                  child: Icon(Icons.close),
                ),
                Spacer(),
                Text(
                  '${drink.price * drink.count} 원',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
