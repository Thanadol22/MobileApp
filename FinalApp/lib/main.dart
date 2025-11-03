import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'pages/odd_number_page.dart';
import 'pages/money_change_page.dart';
import 'pages/student_info_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    OddNumberPage(),
    MoneyChangePage(),
    StudentInfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinalApp',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: Text('FinalApp')),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.numbers),
              label: 'เลขคี่',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: 'ทอนเงิน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'เพื่อนในชั้น',
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
