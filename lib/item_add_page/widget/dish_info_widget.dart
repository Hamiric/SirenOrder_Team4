import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DishInfoWidget extends StatelessWidget {
  const DishInfoWidget(
      {super.key,
      required this.menuNameController,
      required this.menuSubNameController,
      required this.menuPriceController,
      required this.menuDescriptionController});

  final TextEditingController menuNameController;
  final TextEditingController menuSubNameController;
  final TextEditingController menuPriceController;
  final TextEditingController menuDescriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MENU',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                ),
              ),
              const Divider(
                thickness: 1,
              )
            ],
          ),
          // Name 입력창
          TextField(
            controller: menuNameController,
            maxLines: 1,
            decoration: const InputDecoration(
              hintText: '이름을 입력해주세요.',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
            onChanged: (text) {},
          ),
          // SubName 입력창
          TextField(
            controller: menuSubNameController,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 12,
            ),
            inputFormatters: [
              // 영어, 숫자, 공백만 입력
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]')),
            ],
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: '영문 이름을 입력해주세요.',
              hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            onChanged: (text) {},
          ),
          const SizedBox(height: 10),
          // Price 입력창
          TextField(
            controller: menuPriceController,
            maxLines: 1,
            inputFormatters: [
              // 숫자만 입력
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: '₩ 가격을 입력해 주세요.',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
            onChanged: (text) {},
          ),
          const SizedBox(height: 30),
          // Description 입력창
          TextField(
            controller: menuDescriptionController,
            maxLines: 12,
            decoration: const InputDecoration(
              hintText: '메뉴에 대해 설명해주세요!',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(),
            ),
            onChanged: (text) {},
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
