import 'package:flutter/material.dart';

class SirenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onActionPressed;
  final IconData? actionIcon;

  const SirenAppBar({
    super.key,
    this.onActionPressed,
    this.actionIcon, // 기본 아이콘임. AppBar안에 actionIcon: Icons.아이콘이름, /n onActionPressed: (){}, 이렇게 변경해서 사용함
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Text.rich(
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
      actions: [
        IconButton(
          icon: Icon(actionIcon, color: Colors.black),
          onPressed: onActionPressed,
        ),
        SizedBox(width: 5,)
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // 기본 AppBar 높이
}
