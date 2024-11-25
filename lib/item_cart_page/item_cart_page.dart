import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team4_groupproject/drink.dart';
import 'package:team4_groupproject/item_list_page/item_list_page.dart';

class ItemCartPage extends StatefulWidget {
  const ItemCartPage({super.key});

  @override
  State<ItemCartPage> createState() => _ItemCartPageState();
}

class _ItemCartPageState extends State<ItemCartPage> {
  List<Drink> dList = drinkList.where((drink) => drink.count > 0).toList();

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
                onPressed: dList.isNotEmpty
                    ? () {
                        showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                  title: Text('구매가 완료되었습니다.'),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: const Text(
                                        '확인',
                                      ),
                                      onPressed: () {
                                        dList.forEach(
                                            (drink) => drink.count = 0);
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                          '/item_list_page',
                                          (Route<dynamic> route) => false,
                                        );
                                      },
                                    )
                                  ]);
                            });
                      }
                    : null,
                child: Text(
                  '구매하기',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF674636),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
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
                            if (drink.count > 1) drink.count--;
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
                            if (drink.count < 99) drink.count++;
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
                                  child: const Text('취소'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: const Text(
                                    '삭제',
                                    style: TextStyle(color: Colors.red),
                                  ),
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
