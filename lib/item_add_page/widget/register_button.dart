import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team4_groupproject/drink.dart';

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

        showCupertino(context, is_showCupertino);
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
  if (menuNameController.text != '' &&
      menuSubNameController.text != '' &&
      menuPriceController.text != '' &&
      menuDescriptionController.text != '' &&
      selectedImage != null) {
    return true;
  } else {
    return false;
  }
}

// CupertinoDialog를 띄우는 함수
void showCupertino(BuildContext context, bool is_approve) {
  String refuseRegistration = '메뉴 등록 실패';
  String approveRegistration = '메뉴 등록 완료';

  showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            is_approve ? approveRegistration : refuseRegistration,
          ),
          content: is_approve ? null : const Text('빈칸이 없는지 다시 확인해 주세요.'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('확인'),
              onPressed: () {
                if (is_approve) {
                  // Drink 객체 만들어서 넘겨주고

                  // item_list_page로
                  Navigator.pop(context);
                  // Navigator.pop(context);
                } else {
                  // 팝업만 끄기
                  Navigator.pop(context);
                }
              },
            )
          ],
        );
      });
}
