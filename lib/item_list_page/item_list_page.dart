import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siren',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ItemListPage(),
      routes: {
        '/item_add_page': (context) => const ItemAddPage(),
        '/item_detail_page': (context) => const ItemDetailPage(),
        '/item_cart_page': (context) => const ItemCartPage(),
      },
    );
  }
}

class ItemListPage extends StatelessWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Siren'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/item_add_page');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFAAB396),
              radius: 40
            ),
            title: const Text('상품 이름 1'),
            subtitle: const Text('16,000 원'),
            onTap: () {
              Navigator.pushNamed(context, '/item_detail_page');
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/item_cart_page');
        },
        backgroundColor: const Color(0xFFAAB396),
        child: const Icon(Icons.shopping_cart,
        color: const Color(0xFFFFF8E8),),
        
      ),
    );
  }
}

class ItemAddPage extends StatelessWidget {
  const ItemAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: const Center(
        child: Text('Item Add Page'),
      ),
    );
  }
}

class ItemDetailPage extends StatelessWidget {
  const ItemDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('Item Detail Page'),
      ),
    );
  }
}

class ItemCartPage extends StatelessWidget {
  const ItemCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const Center(
        child: Text('Cart Page'),
      ),
    );
  }
}
