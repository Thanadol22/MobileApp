import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentInfoPage extends StatefulWidget {
  @override
  _StudentInfoPageState createState() => _StudentInfoPageState();
}

class _StudentInfoPageState extends State<StudentInfoPage> {
  List<Map<String, dynamic>> students = [];
  final String apiUrl = "http://10.0.2.2/finalapp_api/student_api.php"; // ✅ Emulator URL

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    try {
      final res = await http.get(Uri.parse(apiUrl));
      if (res.statusCode == 200) {
        final decoded = json.decode(res.body);
        if (decoded is List) {
          setState(() {
            students = List<Map<String, dynamic>>.from(decoded);
          });
        }
      } else {
        print("❌ Error fetching students: ${res.statusCode}");
      }
    } catch (e) {
      print("❌ Exception: $e");
    }
  }

  Future<void> addStudent(String name, String phone, String map) async {
    try {
      final res = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'NAME': name, 'phone': phone, 'map_link': map}),
      );

      print("📩 Response: ${res.body}");

      if (res.statusCode == 200) {
        fetchStudents();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("บันทึกข้อมูลไม่สำเร็จ (${res.statusCode})")),
        );
      }
    } catch (e) {
      print("❌ Error adding student: $e");
    }
  }

  void _showAddDialog() {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final mapCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('เพิ่มข้อมูลเพื่อนในชั้น'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameCtrl, decoration: InputDecoration(labelText: 'ชื่อ - นามสกุล')),
              TextField(controller: phoneCtrl, decoration: InputDecoration(labelText: 'เบอร์โทรศัพท์')),
              TextField(controller: mapCtrl, decoration: InputDecoration(labelText: 'ลิงก์ Google Maps')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('ยกเลิก')),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isEmpty || phoneCtrl.text.isEmpty || mapCtrl.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("กรุณากรอกข้อมูลให้ครบถ้วน")),
                );
                return;
              }
              addStudent(nameCtrl.text, phoneCtrl.text, mapCtrl.text);
              Navigator.pop(context);
            },
            child: Text('บันทึก'),
          ),
        ],
      ),
    );
  }

  void _openDetail(Map<String, dynamic> student) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => StudentDetailPage(student: student),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('เพื่อนในชั้น')),
      body: students.isEmpty
          ? Center(child: Text('ยังไม่มีข้อมูลเพื่อนในชั้น'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: students.length,
              itemBuilder: (context, index) {
                var s = students[index];
                final name = s['NAME'] ?? 'ไม่ระบุชื่อ';
                final phone = s['phone'] ?? '-';

                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(name),
                    subtitle: Text('โทร: $phone'),
                    trailing: Icon(Icons.map),
                    onTap: () => _openDetail(s),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

// -------------------------------------------------------------------

class StudentDetailPage extends StatelessWidget {
  final Map<String, dynamic> student;
  const StudentDetailPage({required this.student});

  String _normalizeMapUrl(String url) {
    if (url.startsWith('intent://')) {
      final match = RegExp(r'q=([\d\.\-]+),([\d\.\-]+)').firstMatch(url);
      if (match != null) {
        final lat = match.group(1);
        final lng = match.group(2);
        return 'https://www.google.com/maps?q=$lat,$lng';
      }
    }
    if (url.startsWith('geo:')) {
      final coords = url.substring(4).split('?').first;
      return 'https://www.google.com/maps?q=$coords';
    }
    if (url.contains('maps.app.goo.gl')) {
      final match = RegExp(r'(\d{1,2}\.\d+),(\d{1,3}\.\d+)').firstMatch(url);
      if (match != null) {
        final lat = match.group(1);
        final lng = match.group(2);
        return 'https://www.google.com/maps?q=$lat,$lng';
      }
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    final name = student['NAME'] ?? 'ไม่ระบุชื่อ';
    final phone = student['phone'] ?? '-';
    final rawUrl = (student['map_link'] ?? '').toString();
    final mapUrl = _normalizeMapUrl(rawUrl);

    if (mapUrl.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(name)),
        body: Center(child: Text('ไม่มีลิงก์แผนที่สำหรับเพื่อนคนนี้')),
      );
    }

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            if (request.url.startsWith('https://www.google.com/maps')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(mapUrl));

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ชื่อ - นามสกุล: $name', style: TextStyle(fontSize: 18)),
                Text('เบอร์โทรศัพท์: $phone', style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Text('ตำแหน่งแผนที่บ้าน:', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Expanded(child: WebViewWidget(controller: controller)),
        ],
      ),
    );
  }
}
