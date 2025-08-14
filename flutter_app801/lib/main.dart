import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('App 801')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            textButton(),
            const SizedBox(height: 30),
            elevatedButton(),
            const SizedBox(height: 30),
            outlineButton(),
          ],
        ),
      ),
    ),
  );
  Widget textButton() => TextButton(
    onPressed: null,
    child: Text(
      'Text Button',
      style: TextStyle(
        color: Colors.indigo,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Tahama',
      ),
    ),
  );

  Widget elevatedButton() => ElevatedButton(
    onPressed: () {},
    child: const Text(
      'Elevated Button',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.lightBlue,
      foregroundColor: Colors.white,
      shape: const StadiumBorder(),
    ),
  );

  Widget outlineButton() => OutlinedButton(
    onPressed: () {},
    child: const Text(
      'Outline Button', 
      style: TextStyle(fontSize: 20)),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Colors.black26,
          width: 1.2,
          style: BorderStyle.solid
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15)
        )
      ),
  );
}
