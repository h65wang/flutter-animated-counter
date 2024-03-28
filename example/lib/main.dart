import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedFlipCounter Demo'),
      ),
      body: Scrollbar(
        child: ListView(
          children: [
            AnimatedFlipCounter(
              value: _value,
            ),
            AnimatedFlipCounter(
              value: 10000000 + _value,
              fractionDigits: 2,
              wholeDigits: 8,
              hideLeadingZeroes: true,
              thousandSeparator: ',',
            ),
            AnimatedFlipCounter(
              value: 10000000 + _value,
              fractionDigits: 2,
              wholeDigits: 8,
              hideLeadingZeroes: true,
            ),
            AnimatedFlipCounter(
              value: 10000000 + _value,
              fractionDigits: 2,
              thousandSeparator: ',',
            ),
            AnimatedFlipCounter(
              value: 10000000 + _value,
              fractionDigits: 2,
            ),
            AnimatedFlipCounter(
              value: _value,
              duration: const Duration(seconds: 1),
              padding: const EdgeInsets.all(8),
              curve: Curves.elasticOut,
              wholeDigits: 4,
              fractionDigits: 2,
              hideLeadingZeroes: true,
              thousandSeparator: ',',
              textStyle: const TextStyle(fontSize: 32, color: Colors.purple),
            ),
            AnimatedFlipCounter(
              value: _value,
              duration: const Duration(seconds: 1),
              curve: Curves.bounceOut,
              wholeDigits: 4,
              fractionDigits: 2,
              thousandSeparator: ',',
              textStyle: const TextStyle(fontSize: 32, color: Colors.blue),
            ),
            AnimatedFlipCounter(
              value: _value,
              // Use "infix" to show a value between negative sign and number
              infix: ' \$',
              fractionDigits: 2,
              wholeDigits: 8,
              hideLeadingZeroes: true,
              // Some languages like French use comma as decimal separator
              decimalSeparator: ',',
              thousandSeparator: '.',
              padding: const EdgeInsets.all(8),
              textStyle: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                letterSpacing: -8.0,
                color: _value < 0 ? Colors.red : Colors.green,
                shadows: const [
                  BoxShadow(
                    color: Colors.yellow,
                    offset: Offset(2, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            AnimatedFlipCounter(
              value: (_value * 10000) + 0.48,
              fractionDigits: 2,
              wholeDigits: 8,
              hideLeadingZeroes: true,
              thousandSeparator: ',',
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [0.01, 0.48, 1, 5, 400].map(_buildButtons).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(num value) {
    return Column(
      children: [
        ElevatedButton(
          child: Text('+$value'),
          onPressed: () => setState(() => _value += value),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          child: Text('-$value'),
          onPressed: () => setState(() => _value -= value),
        ),
      ],
    );
  }
}
