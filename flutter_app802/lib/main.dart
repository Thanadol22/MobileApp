import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(home: HomePage());
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _value = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('App 802')),
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [btnMinus(), Text('  $_value   '), btnPlus()],
      ),
    ),
  );

  Widget btnMinus() => OutlinedButton(
    onPressed: () {
      if (_value > 0) {
        setState(() => _value -= 1);
      }
    },
    child: Text(' - ', style: TextStyle(fontSize: 30)),
    style: OutlinedButton.styleFrom(
      side: BorderSide(
        color: Colors.black26,
        width: 1.2,
        style: BorderStyle.solid,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
    ),
  );

  Widget btnPlus() => OutlinedButton(
    onPressed: () => setState(() => _value += 1),
    child: Text(' + ', style: TextStyle(fontSize: 30)),
    style: OutlinedButton.styleFrom(
      side: BorderSide(
        color: Colors.black26,
        width: 1.2,
        style: BorderStyle.solid,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
    ),
  );
}
