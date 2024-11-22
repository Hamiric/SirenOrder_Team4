import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DishInfoWidget extends StatelessWidget {
  const DishInfoWidget({super.key});

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
          const TextField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: '이름을 입력해주세요.',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            maxLines: 1,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: '₩ 가격을 입력해 주세요.',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const TextField(
            maxLines: 12,
            decoration: InputDecoration(
              hintText: '메뉴에 대해 설명해주세요!',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
