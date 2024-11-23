import 'package:flutter/material.dart';
import 'package:team4_groupproject/item_add_page/item_add_page.dart';
import 'package:team4_groupproject/item_cart_page/item_cart_page.dart';
import 'package:team4_groupproject/item_detail_page/item_detail_page.dart';
import 'package:team4_groupproject/item_list_page/item_list_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SirenOrder',
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/item_add_page': (context) => const ItemAddPage(),
        '/item_cart_page': (context) => const ItemCartPage(),
        '/item_detail_page': (context) => const ItemDetailPage(),
        '/item_list_page' : (context) => const ItemListPage(),
      },
      initialRoute: '/item_list_page',
    );
  }
}
