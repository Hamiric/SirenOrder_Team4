import 'dart:io';
import 'package:flutter/material.dart';
import 'package:team4_groupproject/drink.dart';
import 'package:team4_groupproject/item_detail_page/widget/siren_app_bar.dart';

List<Drink> drinkList = [
  Drink(
      name: '초코 플랫 화이트',
      code: 'Choco Flat White',
      img: 'assets/menu.jpg',
      description:
          '저희 카페에서 고안한\n새로운 플랫 화이트 입니다.\n\n기존의 우유 스팀으로 거품을 올린 것과는 다르게\n스팀을 치기 전, 발로나 초코를 우유에 넣어줍니다.\n\n정말로 맛있습니다.\n\n여러분의 (미리)구매 버튼만 있다면\n저희 집 특제 초코 플랫 화이트를\n현실에서 직접 맛보실 수 있습니다!\n미리 미리 많이 많이 눌러 주세요!',
      price: 5000,
      count: 0,
      isFavorite: false),
  Drink(
      name: '오렌지 마끼아또',
      code: 'Orange Macchiato',
      img: 'assets/caramel_macchiato.jpg',
      description:
          '이번에 저희 가게에서 출시 예정인\n오렌지! 오렌지 마끼아또 입니다.\n\n제철 맞은 싱싱한 오렌지 과육을\n살짝 말려, 우유거품위에 올리고\n그 위에 또 우유거품을 올려\n오렌지 마말레이드를 카라멜 시럽처럼\n예쁘게 올려주었습니다.\n\n여러분의 소중한 (미리)구매 한번으로…!\n저희 가게에서 직접 대접해 드릴 수 있다면\n정말로 좋겠습니다!',
      price: 4500,
      count: 0,
      isFavorite: false),
  Drink(
      name: '민트 아이스 아메리카노',
      code: 'Mint Iced Americano',
      img: 'assets/iced_americano.jpg',
      description:
          '시원하고 깔끔한 민트!\n민트 잎과 커피원두를 섞어서\n함께 내려준!\n저희 집만의 특제 레시피 입니다!\n\n하도 친구들이 팔아보라고 해서\n여기 사이렌에 올려 보기로 했습니다!\n\n반응이 좋으면 바로 판매 게시 하도록 하겠습니다!\n미리미리 많이 눌러주세요!',
      price: 3000,
      count: 0,
      isFavorite: false),
  Drink(
      name: '비네갈 그린티 라떼',
      code: 'Vinegar Green Tea Latte',
      img: 'assets/green_tea_latte.jpg',
      description:
          '여러분 그거 아시나요?\n녹차와 식초는 궁합이 정말 좋습니다!\n\n저는 피곤할 때, 꼭! 그린티 라떼에\n저희집 특제 식초를 넣어주는데요\n정말… 한숨 푹자고 일어난거처럼\n쌩쌩해집니다!\n\n그리고 이건 진짜 알려드리면 안되는데…\n이거 마시면 큰볼일도 5초컷입니다!\n\n여러분의 미리 구매 버튼으로\n대접해 드릴 수 있다면 정말로\n좋겠습니다.\n\n나중에 꼭 만나요!',
      price: 4800,
      count: 0,
      isFavorite: false),
  Drink(
      name: '딸기 석류 스무디',
      code: 'Strawberry Pomegranate Smoothie',
      img: 'assets/strawberry_smoothie.jpg',
      description:
          '딸기~ 석류~\n이 빨간 친구들이\n\n궁합이 좋다는거\n알고들 계셨나요?\n\n저희 가게에서 이번에 출시예정인\n딸기 석류 스무디는\n정말 특별하답니다.\n\n우리 아이들도 너무 좋아해서\n다 마시면 꼭 한잔더!를 외칩니다.\n\n여러분과 만날 날을 기대하고 있을게요...',
      price: 5200,
      count: 0,
      isFavorite: false),
  Drink(
      name: '리얼 초코 프라푸치노',
      code: 'Real Choco Frappuccino',
      img: 'assets/mocha_frappuccino.jpg',
      description:
          '카카오 열매 따는거\n보신 적 있으신가요?\n\n저희 가게에서 출시예정인\n이 리얼 초코! 프라푸치노는\n보통 가게에서 파는\n초코 음료와는 차원이 다릅니다.\n\n가게에서는 라이브 방송으로\n직원들의 카카오 열매따는 모습부터 시작해\n열매 손질부터 초콜렛을 만드는 과정까지\n모두 보여드립니다.\n\n진짜 초코를 드세요.\n지금까지 드신건 모두 가짜(?)\n입니다!!!\n\n이게 리얼이에요 리얼…',
      price: 5500,
      count: 0,
      isFavorite: false),
  Drink(
      name: '피넛츠 라떼',
      code: 'Peanuts Latte',
      img: 'assets/vanilla_latte.jpg',
      description:
          '땅콩라떼 입니다.\n커피 들어가요.\n\n저희 엄마가 땅콩 버터를 너무 좋아하셔서\n한번 만들어 봤는데…\n정말 매일 드시네요……\n\n그래서 돈받고 마시라고\n정식으로 메뉴 출시 예정입니다.\n\n많은 관심 부탁드립니다.\n',
      price: 4700,
      count: 0,
      isFavorite: false),
];

class ItemListPage extends StatelessWidget {
  ItemListPage({super.key, this.newDrink});

  final Drink? newDrink;

  @override
  Widget build(BuildContext context) {
    if (newDrink != null) {
      drinkList.insert(0, newDrink!);
    }

    return Scaffold(
      appBar: SirenAppBar(
        actionIcon: Icons.add, // AppBar의 우측 아이콘 설정
        onActionPressed: () {
          // 아이콘 클릭 시 동작 설정
          Navigator.pushNamed(context, '/item_add_page');
        },
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
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
                const SizedBox(height: 4),
                Text(
                  drinkList[index].code,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  softWrap: false,
                  overflow: TextOverflow.fade,
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
