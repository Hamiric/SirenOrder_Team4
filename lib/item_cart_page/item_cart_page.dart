import 'dart:io';
import 'package:flutter/material.dart';
import 'package:team4_groupproject/drink.dart';
import 'package:team4_groupproject/item_detail_page/widget/siren_app_bar.dart';
import 'package:team4_groupproject/item_list_page/item_list_page.dart';
import 'package:team4_groupproject/number_format.dart';

class ItemCartPage extends StatefulWidget {
  const ItemCartPage({super.key});

  @override
  State<ItemCartPage> createState() => _ItemCartPageState();
}

class _ItemCartPageState extends State<ItemCartPage> {
  // 음료 리스트 중 갯수가 1 이상인 항목
  List<Drink> dList = drinkList.where((drink) => drink.count > 0).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SirenAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: dList.isEmpty
                  ? const Center(
                      child: Text('장바구니가 비었습니다'),
                    )
                  : ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: List.generate(dList.length, (i) {
                        return itemRow(dList[i], i);
                      }),
                    ),
            ),
            orderButton(context),
          ],
        ),
      ),
    );
  }

  /// 음료 위젯
  Widget itemRow(Drink drink, int i) {
    return Container(
      width: double.infinity,
      height: 112,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color(0xFFAAB396),
        width: 1,
      ))),
      child: Row(
        children: [
          // 이미지 영역
          Container(
            margin: const EdgeInsets.only(right: 16),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1, color: const Color(0xFFAAB396))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: isAssets(drink),
            ),
          ),
          // 이름 및 갯수 영역
          Expanded(
            child: Container(
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 음료 이름
                  Text(
                    drink.name,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                  // 음료 영어 이름
                  Text(
                    drink.code,
                    style: const TextStyle(
                      color: Color(0xFFAAB396),
                    ),
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                  const Spacer(),
                  // 갯수 영역
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (drink.count > 1) drink.count--;
                          });
                        },
                        child: (drink.count != 1)
                            ? const Icon(Icons.remove)
                            : Icon(
                                Icons.remove,
                                color: Colors.grey[400],
                              ),
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
                        child: (drink.count != 99)
                            ? const Icon(Icons.add)
                            : Icon(
                                Icons.add,
                                color: Colors.grey[400],
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // 삭제 및 가격 영역
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // 음료 삭제
                GestureDetector(
                  onTap: () {
                    deleteDrink(i);
                  },
                  child: const Icon(Icons.close),
                ),
                const Spacer(),
                // 음료 총 가격
                Text(
                  numberFormat(drink.price * drink.count) ,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 음료 삭제
  void deleteDrink(int i) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              width: 230,
              height: 45,
              child: const Center(
                child: Text(
                  '삭제하시겠습니까?',
                  style: TextStyle(fontSize: 15, color: Colors.black),
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
                    Navigator.of(context).pop(); // 취소 버튼 동작
                  },
                  child: const Text(
                    '취소',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      try {
                        dList[i].count = 0;
                        dList.removeAt(i);
                      } catch (e) {}
                    });
                    Navigator.of(context).pop(); // 삭제 버튼 동작
                  },
                  child: const Text(
                    '삭제',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  /// 이미지 경로 설정
  Widget isAssets(Drink drink) {
    if (drink.img.startsWith('assets/')) {
      return Image.asset(
        drink.img,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset('assets/images/coffee.jpg', fit: BoxFit.cover);
        },
      );
    } else {
      return Image.file(
        File(drink.img),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset('assets/images/coffee.jpg', fit: BoxFit.cover);
        },
      );
    }
  }

  /// 구매하기 버튼
  Widget orderButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 84,
      child: ElevatedButton(
        // 음료가 없을 경우 버튼 비활성화
        onPressed: dList.isNotEmpty
            ? () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          content: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(
                              width: 230,
                              height: 45,
                              child: const Center(
                                child: Text(
                                  '구매가 완료되었습니다.',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  child: const Text(
                                    '확인',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  onPressed: () {
                                    // 구매 후 음료 갯수 초기화, item_list_page로 이동
                                    dList.forEach((drink) => drink.count = 0);
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      '/item_list_page',
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                ),
                              ],
                            )
                          ]);
                    });
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF674636),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        child: const Text(
          '구매하기',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
