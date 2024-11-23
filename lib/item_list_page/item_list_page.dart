import 'package:flutter/material.dart';

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