import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedFlipCounter Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedFlipCounter(
              value: 1000 + _value,
            ),
            AnimatedFlipCounter(
              value: 1000 + _value,
              wholeDigits: 4,
              fractionDigits: 2,
              thousandSeparator: ',',
            ),
            AnimatedFlipCounter(
              value: _value,
              duration: Duration(seconds: 2),
              padding: EdgeInsets.symmetric(vertical: 8),
              curve: Curves.elasticOut,
              textStyle: TextStyle(fontSize: 60, color: Colors.pink),
            ),
            AnimatedFlipCounter(
              value: _value,
              duration: Duration(seconds: 1),
              curve: Curves.bounceOut,
              wholeDigits: 4,
              fractionDigits: 2,
              textStyle: TextStyle(fontSize: 40, color: Colors.blue),
            ),
            AnimatedFlipCounter(
              value: _value,
              prefix: "Level ",
              padding: EdgeInsets.all(8),
              textStyle: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                letterSpacing: -8.0,
                color: Colors.yellow,
                shadows: [
                  BoxShadow(
                    color: Colors.orange,
                    offset: Offset(2, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            AnimatedFlipCounter(
              value: _value + 0.48,
              fractionDigits: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [0.07, 0.48, 1, 5, 24].map(_buildButton).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(num value) {
    return Column(
      children: [
        ElevatedButton(
          child: Text('+$value'),
          onPressed: () => setState(() => _value += value),
        ),
        ElevatedButton(
          child: Text('-$value'),
          onPressed: () => setState(() => _value -= value),
        ),
      ],
    );
  }
}
