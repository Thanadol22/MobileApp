import 'package:flutter/material.dart';

void main() {
  runApp(const Me());
}

class Me extends StatelessWidget {
  const Me({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;

        return SingleChildScrollView(
          child: Container(
            color: Colors.lightBlue[100],
            height: screenHeight,
            child: Stack(
              children: [
                const Positioned(
                  bottom: 30,
                  left: 200,
                  child: CircleAvatar(
                    radius: 150,
                    backgroundColor: Color.fromARGB(255, 126, 214, 255),
                  ),
                ),
                const Positioned(
                  bottom: 300,
                  left: 30,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Color.fromARGB(255, 148, 216, 248),
                  ),
                ),
                const Positioned(
                  right: 100,
                  top: -80,
                  child: CircleAvatar(
                    radius: 200,
                    backgroundColor: Color(0xFF4FC3F7),
                  ),
                ),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Center(
                        child: Image.asset(
                          'assets/images/me2.jpg',
                          width: 220,
                          height: 220,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'ชื่อ-นามสกุล นาย ธนดล จำปาเต็ม',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 6),
                            Text('ชื่อเล่น เพชร', style: TextStyle(fontSize: 18)),
                            SizedBox(height: 6),
                            Text('เกิดเมื่อ 22 กันยายน 2545', style: TextStyle(fontSize: 18)),
                            SizedBox(height: 6),
                            Text('อายุ 22', style: TextStyle(fontSize: 18)),
                            SizedBox(height: 6),
                            Text('สัญชาติไทย', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
