class Drink {
  String name = ''; // 상품 이름
  String code = ''; // 상품 코드 혹은 영문 명
  String img = ''; // 상품 이미지 경로
  String description = ''; // 상품 설명
  int price = 0; // 상품 가격
  int count = 0; // 상품 갯수
  bool isFavorite = false; // 즐겨찾기 유무

  Drink({
    required this.name,
    required this.code,
    required this.img,
    required this.description,
    required this.price,
    required this.count,
    required this.isFavorite,
  });
}
