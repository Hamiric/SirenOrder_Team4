import 'dart:io';

import 'package:flutter/material.dart';
import 'package:team4_groupproject/item_detail_page/widget/menu_script.dart';

import '../drink.dart';

class ItemListPage extends StatelessWidget {
  ItemListPage({super.key, this.newDrink});

  final Drink? newDrink;
  List<Drink> drinkList = [
    Drink(
        name: '초코 플랫 화이트',
        code: 'Choco Flat White',
        img: 'assets/menu.jpg',
        description:
            '저희 카페에서 고안한\n새로운 플랫 화이트 입니다.\n\n기존의 우유 스팀으로 거품을 올린 것과는 다르게\n스팀을 치기 전, 발로나 초코를 우유에 넣어줍니다.\n\n정말로 맛있습니다.\n\n여러분의 구매 버튼만 있다면\n저희 집 특제 초코 플랫 화이트를\n현실에서 직접 맛보실 수 있습니다!\n많이 많이 눌러 주세요!',
        price: 5000,
        count: 0,
        isFavorite: false),
  ];

  @override
  Widget build(BuildContext context) {
    if (newDrink != null) {
      drinkList.insert(0, newDrink!);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Siren'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/item_add_page');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: drinkList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
                backgroundImage: is_CheckImageFile(drinkList[index].img)
                    ? FileImage(File(drinkList[index].img))
                    : AssetImage(drinkList[index].img),
                backgroundColor: Color(0xFFAAB396),
                radius: 40),
            title: Text(drinkList[index].name),
            subtitle: Text('${drinkList[index].price} 원'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/item_detail_page',
                arguments: drinkList[index],  
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/item_cart_page');
        },
        backgroundColor: const Color(0xFFAAB396),
        child: const Icon(
          Icons.shopping_cart,
          color: const Color(0xFFFFF8E8),
        ),
      ),
    );
  }

  // CircleAvatar에 들어갈 이미지 형태가 2종류라서 체크하는 함수
  // false = assets, true = XFile
  bool is_CheckImageFile(String img) {
    List<String> splitImgPath = img.split('/');

    if (splitImgPath[0] == 'assets') {
      return false;
    } else {
      return true;
    }
  }
}
