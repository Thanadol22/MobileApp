import 'package:flutter/material.dart';

class OddNumberPage extends StatefulWidget {
  @override
  _OddNumberPageState createState() => _OddNumberPageState();
}

class _OddNumberPageState extends State<OddNumberPage> {
  final TextEditingController _controller = TextEditingController();
  List<int> oddNumbers = [];

  void generateOddNumbers() {
    int? maxNum = int.tryParse(_controller.text);
    if (maxNum == null || maxNum <= 0 || maxNum > 1000) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('กรุณากรอกตัวเลขระหว่าง 1 - 1000')),
      );
      return;
    }

    setState(() {
      oddNumbers = List.generate((maxNum + 1) ~/ 2, (i) => i * 2 + 1)
          .where((n) => n <= maxNum)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('แสดงเลขคี่ไม่เกินจำนวนที่กำหนด', style: TextStyle(fontSize: 18)),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'กรอกจำนวนสูงสุด (ไม่เกิน 1000)'),
          ),
          ElevatedButton(
            onPressed: generateOddNumbers,
            child: Text('แสดงผล'),
          ),
          Expanded(
            child: ListView(
              children: oddNumbers.map((e) => ListTile(title: Text('$e'))).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
