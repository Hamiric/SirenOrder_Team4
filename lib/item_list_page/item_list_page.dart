import 'dart:io';

import 'package:flutter/material.dart';

import '../drink.dart';

class ItemListPage extends StatelessWidget {
  ItemListPage({super.key, this.newDrink});

  final Drink? newDrink;
  List<Drink> drinkList = [
    Drink(
        name: '초코 플랫 화이트',
        code: 'Choco Flat White',
        img: 'assets/menu.jpg',
        description: '오스트레일리아와 뉴질랜드에서 가장 즐겨먹는 커피 에스프레소의 미세한 입자의 마이크로 폼 스팀 밀크를 혼합해 만든 플랫화이트는 아주 고운 스팀밀크를 사용해 실크나 벨벳 질감에 비유될 만큼 부드럽습니다 카페라떼와 카푸치노의 차이를 들자면 플랫화이트가 더 부드럽고 커피향이 진한 편입니다',
        price: 6200,
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
              backgroundImage: is_CheckImageFile(drinkList[index].img) ? FileImage(File(drinkList[index].img)) : AssetImage(drinkList[index].img),
              backgroundColor: Color(0xFFAAB396), radius: 40
            ),
            title: Text(drinkList[index].name),
            subtitle: Text('${drinkList[index].price} 원'),
            onTap: () {
              Navigator.pushNamed(context, '/item_detail_page');
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
  bool is_CheckImageFile(String img){
    List<String> splitImgPath = img.split('/');

    if(splitImgPath[0] == 'assets') {
      return false;
    } else {
      return true;
    }
  }
}
