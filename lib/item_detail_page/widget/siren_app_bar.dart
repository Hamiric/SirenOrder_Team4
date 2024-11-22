import 'package:flutter/material.dart';

class SirenAppBar extends StatelessWidget implements PreferredSizeWidget{
  const SirenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Padding(
        padding: const EdgeInsets.only(top: 17),
        child: AppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left, color: Colors.black),
                  onPressed: () {},
                ),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: 'S',
                      style: TextStyle(
                        color: Color(0xFFAAB396),
                        fontSize: 32,
                      ),
                    ),
                    TextSpan(
                      text: 'iren',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                  ]),
                ),
                IconButton(
                  icon: const Icon(Icons.share_outlined, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);

}
