import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team4_groupproject/drink.dart';
import 'package:team4_groupproject/item_list_page/item_list_page.dart';

class RegisterButton extends StatelessWidget {
  RegisterButton(
      {super.key,
      required this.menuNameController,
      required this.menuSubNameController,
      required this.menuPriceController,
      required this.menuDescriptionController,
      required this.selectedImage});

  final TextEditingController menuNameController;
  final TextEditingController menuSubNameController;
  final TextEditingController menuPriceController;
  final TextEditingController menuDescriptionController;

  final XFile? selectedImage;

  bool is_showCupertino = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // 모든 요소가 null 값이 아닐 경우 true
        is_showCupertino = checkShowCupertino(
            menuNameController,
            menuSubNameController,
            menuPriceController,
            menuDescriptionController,
            selectedImage);

        // is_showCupertino 값이 true일경우, Drink 데이터 넘김
        // is_showCupertino 값이 false일 경우, 메뉴등록실패
        showCupertino(
            context,
            is_showCupertino,
            menuNameController,
            menuSubNameController,
            menuPriceController,
            menuDescriptionController,
            selectedImage);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff674636),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
      ),
      child: Container(
        color: Colors.transparent,
        height: 80,
        child: const Center(
          child: Text(
            '등록하기',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

// Cupertino text제어를 위한 함수
bool checkShowCupertino(
    TextEditingController menuNameController,
    TextEditingController menuSubNameController,
    TextEditingController menuPriceController,
    TextEditingController menuDescriptionController,
    XFile? selectedImage) {
  if (menuNameController.text.isNotEmpty &&
      menuSubNameController.text.isNotEmpty &&
      menuPriceController.text.isNotEmpty &&
      menuDescriptionController.text.trim().isNotEmpty &&
      selectedImage != null) {
    return true;
  } else {
    return false;
  }
}

// CupertinoDialog를 띄우는 함수
void showCupertino(
    BuildContext context,
    bool is_approve,
    TextEditingController menuNameController,
    TextEditingController menuSubNameController,
    TextEditingController menuPriceController,
    TextEditingController menuDescriptionController,
    XFile? selectedImage) {
  String refuseRegistration = '메뉴 등록 실패';
  String approveRegistration = '메뉴 등록 완료';

  showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: SizedBox(
            height: 80,
            child: Center(
              child: Text(
                is_approve ? approveRegistration : refuseRegistration,
                style: const TextStyle(
                  fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
          content: is_approve ? null : const Text('빈칸이 없는지 다시 확인해 주세요.'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text(
                '확인',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                if (is_approve) {
                  // 등록 성공했을 경우 Drink 객체 만들어서 데이터 넘겨주기
                  Drink newDrink = Drink(
                    name: menuNameController.text,
                    code: menuSubNameController.text,
                    img: selectedImage!.path,
                    description: menuDescriptionController.text,
                    price: int.parse(menuPriceController.text),
                    count: 0,
                    isFavorite: false,
                  );
                  
                  // item_list_page로
                  Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoDialogRoute(
                      builder: (context) => ItemListPage(newDrink: newDrink),
                      context: context
                    ),
                    (route) => false,
                  );
                } else {
                  // 실패했을 경우 팝업만 끄기
                  Navigator.pop(context);
                  FocusScope.of(context).unfocus();
                }
              },
            )
          ],
        );
      });
}
