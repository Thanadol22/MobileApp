import 'package:flutter/material.dart';

void main() {
  runApp(const Favorite());
}

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
        color: const Color(0xFFFFF1F7),
        child: Stack(
          children: [
           
            const Positioned(
              top: -60,
              left: -60,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Color(0xFFFFD1DC), 
              ),
            ),
            const Positioned(
              top: 200,
              right: -50,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Color(0xFFA7E9AF), 
              ),
            ),
            const Positioned(
              bottom: -40,
              left: 50,
              child: CircleAvatar(
                radius: 120,
                backgroundColor: Color(0xFFB5EAEA), 
              ),
            ),

            SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.palette, size: 80, color: Colors.deepPurpleAccent),
                      SizedBox(height: 20),
                      Text(
                        'ศิลปะและการออกแบบ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'หลงใหลในการสร้างสรรค์งานศิลป์และออกแบบสื่อดิจิทัล '
                        'ชื่นชอบการออกแบบเว็บไซต์ แอปพลิเคชัน และแบรนด์ดิ้ง '
                        'มีความตั้งใจในการออกแบบที่สามารถถ่ายทอดอารมณ์ ความรู้สึก '
                        'และสร้างประสบการณ์ที่ดีให้กับผู้ใช้งาน',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 30),
                      Icon(Icons.brush, size: 60, color: Colors.pinkAccent),
                      SizedBox(height: 10),
                      Icon(Icons.color_lens, size: 60, color: Colors.teal),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
