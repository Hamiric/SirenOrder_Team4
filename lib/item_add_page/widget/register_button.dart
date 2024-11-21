import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        onPressed: () {},
        child: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width - 80,
          height: 50,
          child: const Center(
            child: Text(
              '등록하기',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
