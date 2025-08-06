import 'package:flutter/material.dart';

void main() {
  runApp(const Education());
}

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        color: Colors.orange[50],
        height: screenHeight,
        child: Stack(
          children: [
            const Positioned(
              top: -50,
              left: -80,
              child: CircleAvatar(
                radius: 120,
                backgroundColor: Color(0xFFFFCC80),
              ),
            ),
            const Positioned(
              top: 250,
              right: -60,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Color(0xFFFFB74D),
              ),
            ),
            const Positioned(
              bottom: -40,
              left: 80,
              child: CircleAvatar(
                radius: 130,
                backgroundColor: Color(0xFFFFA726),
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'การศึกษา',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(height: 30),

                    Card(
                      color: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const ListTile(
                        leading: Icon(Icons.school, color: Colors.deepOrange),
                        title: Text('มัธยมต้น'),
                        subtitle: Text('โรงเรียน ถาวรานุกูล'),
                      ),
                    ),
                    const SizedBox(height: 12),


                    Card(
                      color: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const ListTile(
                        leading: Icon(Icons.school_outlined, color: Colors.orange),
                        title: Text('มัธยมปลาย'),
                        subtitle: Text('วิทยาลัยเทคนิคสมุทรสงคราม'),
                      ),
                    ),
                    const SizedBox(height: 12),


                    Card(
                      color: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const ListTile(
                        leading: Icon(Icons.account_balance, color: Colors.deepOrangeAccent),
                        title: Text('วิทยาลัย'),
                        subtitle: Text('วิทยาลัยเทคนิคสมุทรสงคราม'),
                      ),
                    ),
                    const SizedBox(height: 12),


                    Card(
                      color: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const ListTile(
                        leading: Icon(Icons.school_rounded, color: Colors.orangeAccent),
                        title: Text('มหาวิทยาลัย'),
                        subtitle: Text('มหาวิทยาลัยเทคโนโลยีราชมงคลธัญบุรี'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
