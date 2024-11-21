import 'package:flutter/material.dart';

class ItemCartPage extends StatefulWidget {
  const ItemCartPage({super.key});

  @override
  State<ItemCartPage> createState() => _ItemCartPageState();
}

class _ItemCartPageState extends State<ItemCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('장바구니'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: List.generate(20, (i) {
                  return itemRow();
                }),
              ),
            ),
            // Expanded(child: Text('test')),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('버튼'),
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blue)),
                ))
          ],
        ),
      ),
    );
  }

  Widget itemRow() {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('메뉴이름'),
                    IconButton(
                        onPressed: () {
                          //
                        },
                        icon: Icon(Icons.star_border)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            //
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 20,
                          color: Colors.grey[300],
                          child: Text('1'),
                        ),
                        IconButton(
                            onPressed: () {
                              //
                            },
                            icon: Icon(Icons.add)),
                      ],
                    ),
                    Text('6,000 원'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
