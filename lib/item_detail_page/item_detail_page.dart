import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text.rich(
                TextSpan(
                    children: [
                        TextSpan(
                            text: 'S',
                            style: TextStyle(
                                color: Color(0xFFAAB396),
                                fontSize: 32,
                            ),
                        ),
                    ] 
                ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            
        ),
    );
  }
}
