import 'package:flutter/material.dart';
import 'package:team4_groupproject/drink.dart';

class MenuScript extends StatelessWidget {
  int itemPrice = 5000;
  int getPrice() {
    return itemPrice;
  }
  final bool isStarred;
  final VoidCallback onStarTouch;
  final Drink drink;

  MenuScript({
    required this.isStarred,
    required this.onStarTouch,
    required this.drink,
  });


  @override
  Widget build(BuildContext context) {
    final Drink drink = ModalRoute.of(context)!.settings.arguments as Drink;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'MENU',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: onStarTouch, 
                  icon: Icon(
                    isStarred ? Icons.star : Icons.star_border_outlined,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            drink.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            drink.code,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xffAAB396),
            ),
          ),
          Text(
            '₩ ${drink.price}',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(height: 23),
          Text(
            drink.description,
            style: TextStyle(
              height: 1.05,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
