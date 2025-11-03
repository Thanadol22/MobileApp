import 'package:flutter/material.dart';

class MoneyChangePage extends StatefulWidget {
  @override
  _MoneyChangePageState createState() => _MoneyChangePageState();
}

class _MoneyChangePageState extends State<MoneyChangePage> {
  final TextEditingController totalCtrl = TextEditingController();
  final TextEditingController cashCtrl = TextEditingController();
  Map<int, int> changeResult = {};
  int? changeAmount;

  void calculateChange() {
    int? total = int.tryParse(totalCtrl.text);
    int? cash = int.tryParse(cashCtrl.text);

    if (total == null || cash == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('กรุณากรอกข้อมูลให้ครบถ้วน')),
      );
      return;
    }

    if (cash < total) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('จำนวนเงินไม่เพียงพอ')),
      );
      return;
    }

    int amount = cash - total;
    List<int> banknotes = [500, 100, 50, 20, 10, 5, 2, 1];
    Map<int, int> result = {};

    for (var note in banknotes) {
      result[note] = amount ~/ note;
      amount %= note;
    }

    setState(() {
      changeAmount = cash - total;
      changeResult = result;
    });
  }

  void clearAll() {
    totalCtrl.clear();
    cashCtrl.clear();
    setState(() {
      changeAmount = null;
      changeResult.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('คำนวณเงินทอน', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            TextField(
              controller: totalCtrl,
              decoration: InputDecoration(
                labelText: 'ราคารวมสินค้าทั้งหมด (บาท)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),

            TextField(
              controller: cashCtrl,
              decoration: InputDecoration(
                labelText: 'เงินสดที่ลูกค้าจ่าย (บาท)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: calculateChange,
                  icon: Icon(Icons.calculate),
                  label: Text('คำนวณ'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  onPressed: clearAll,
                  icon: Icon(Icons.refresh),
                  label: Text('ยกเลิก'),
                ),
              ],
            ),
            SizedBox(height: 20),

            if (changeAmount != null) ...[
              Text('ผลลัพธ์การคำนวณ:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text('ราคารวมทั้งหมด: ${totalCtrl.text} บาท'),
              Text('เงินลูกค้าจ่าย: ${cashCtrl.text} บาท'),
              Text('เงินทอนทั้งหมด: $changeAmount บาท'),
              Divider(height: 30, thickness: 2),

              Text('รายละเอียดการทอนเงิน:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ...changeResult.entries.map((e) {
                String type = e.key >= 20 ? 'ธนบัตร' : 'เหรียญ';
                return ListTile(
                  title: Text('$type ${e.key} บาท'),
                  trailing: Text('${e.value} ${type == 'ธนบัตร' ? 'ใบ' : 'เหรียญ'}'),
                );
              }).toList(),
            ],
          ],
        ),
      ),
    );
  }
}
