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
    Drink(
        name: '카라멜 마끼아또',
        code: 'Caramel Macchiato',
        img: 'assets/caramel_macchiato.jpg',
        description:
           '달콤하고 고소한\n카라멜 마끼아또입니다.\n\n부드러운 우유 거품 위에\n카라멜 소스를 듬뿍 얹어\n달콤함을 느낄 수 있어요.',
        price: 4500,
        count: 0,
        isFavorite: false),
    Drink(
        name: '아이스 아메리카노',
        code: 'Iced Americano',
        img: 'assets/iced_americano.jpg',
        description:
          '시원하고 깔끔한\n아이스 아메리카노입니다.\n\n더운 날씨에\n딱 어울리는 상쾌한 음료입니다.',
        price: 3000,
        count: 0,
        isFavorite: false),
    Drink(
        name: '그린티 라떼',
        code: 'Green Tea Latte',
        img: 'assets/green_tea_latte.jpg',
        description:
          '부드러운 우유와\n고소한 녹차가 만나\n환상의 조화를 이루는\n그린티 라떼입니다.',
        price: 4800,
        count: 0,
        isFavorite: false),
    Drink(
        name: '딸기 스무디',
        code: 'Strawberry Smoothie',
        img: 'assets/strawberry_smoothie.jpg',
        description:
          '신선한 딸기로 만든\n달콤한 딸기 스무디입니다.\n\n더운 여름에\n시원하게 즐겨보세요!',
        price: 5200,
        count: 0,
        isFavorite: false),
    Drink(
        name: '모카 프라푸치노',
        code: 'Mocha Frappuccino',
        img: 'assets/mocha_frappuccino.jpg',
        description:
          '진한 초콜릿과\n커피의 풍미가 조화를 이루는\n모카 프라푸치노입니다.\n\n달콤 쌉싸름한 맛을 좋아한다면 추천!',
        price: 5500,
        count: 0,
        isFavorite: false),
    Drink(
        name: '바닐라 라떼',
        code: 'Vanilla Latte',
        img: 'assets/vanilla_latte.jpg',
        description:
        '부드러운 우유와\n달콤한 바닐라 시럽이 만나\n마음까지 편안해지는\n바닐라 라떼입니다.',
        price: 4700,
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
                    : AssetImage(drinkList[index].img) as ImageProvider,
                backgroundColor: const Color(0xFFAAB396),
                radius: 40),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  drinkList[index].name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4), // 간격 추가
                Text(
                  drinkList[index].code,
                  style: const TextStyle(
                    fontSize: 12, // 작은 글씨 크기
                    color: Colors.grey, // 회색 글씨
                  ),
                ),
              ],
            ),
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
          color: Color(0xFFFFF8E8),
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
