import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  // 아바타 애니메이션
  late final AnimationController avatarAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );

  late final Animation<Offset> _avatarOffset = _avatarOffsetAnimation();
  late final CurvedAnimation _avatarcurve = CurvedAnimation(
      parent: avatarAnimationController, curve: Curves.elasticOut);

  // 텍스트 애니메이션
  late final AnimationController textAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );

  late final Animation<Offset> _textOffset = _textOffsetAnimation();
  late final CurvedAnimation _textcurve =
      CurvedAnimation(parent: avatarAnimationController, curve: Curves.linear);

  final AssetImage _avatarImage = const AssetImage('assets/menu.jpg');
  bool _isImagePreloaded = false;

  @override
  void initState() {
    // Avatar 애니메이션이 종료되면, Text 애니메이션 시작
    avatarAnimationController.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        textAnimationController.forward();
      }
    });

    // Text 애니메이션이 종료되면, 페이지 이동
    textAnimationController.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/item_list_page',
            (route) => false,
          );
        });
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // 이미지 프리로딩 (버벅임 해결)
    // 이미지 로딩이 끝나면, 애니메이션 시작
    if (!_isImagePreloaded) {
      precacheImage(_avatarImage, context).then((_) {
        setState(() {
          _isImagePreloaded = true;
        });
        avatarAnimationController.forward();
      });
    }
    super.didChangeDependencies();
  }

  Animation<Offset> _avatarOffsetAnimation() {
    return Tween<Offset>(begin: const Offset(0, -4), end: Offset.zero)
        .animate(_avatarcurve);
  }

  Animation<Offset> _textOffsetAnimation() {
    return Tween<Offset>(begin: const Offset(-5, 0), end: Offset.zero)
        .animate(_textcurve);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoText(),
            const SizedBox(
              height: 20,
            ),
            LogoAvatar(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    avatarAnimationController.dispose();
    textAnimationController.dispose();
    super.dispose();
  }

  Widget LogoText() {
    return SlideTransition(
      position: _textOffset,
      child: const Text.rich(
        TextSpan(children: [
          TextSpan(
            text: 'S',
            style: TextStyle(
              color: Color(0xFFAAB396),
              fontSize: 40,
            ),
          ),
          TextSpan(
            text: 'iren',
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
            ),
          ),
        ]),
      ),
    );
  }

  Widget LogoAvatar() {
    return SlideTransition(
      position: _avatarOffset,
      child: CircleAvatar(
          backgroundImage: _avatarImage,
          backgroundColor: Color(0xFFAAB396),
          radius: 80),
    );
  }
}
