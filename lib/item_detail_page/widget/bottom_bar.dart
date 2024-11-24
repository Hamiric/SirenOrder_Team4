
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterWidget(),
      ],
    ); 
  }
}





class CounterWidget extends StatefulWidget {
  @override
  State<CounterWidget> createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int _counter = 1; // 수량 변수

  void _decrement() {
    setState(() {
        if (_counter > 1) _counter--; // 수량 >0 예외 처리
    });
  }

  void _increment() {
    setState(() {
      if (_counter < 100) _counter++; // 수량 <100 예외 처리
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffFFF8E8),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: _decrement, 
              icon: Icon(Icons.remove),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 24),
            ),
            IconButton(
              onPressed: _increment, 
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
