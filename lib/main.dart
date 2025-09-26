import 'package:flutter/material.dart';

void main() {
  runApp(const MyBigDesignApp());
}

class MyBigDesignApp extends StatelessWidget {
  const MyBigDesignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Big UI Design',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              children: [
                Container(
                  height: size.height * 0.35,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF00b09b), Color(0xFF96c93d)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      CustomMainButton(
                        text: 'ابدأ الآن',
                        color: Colors.deepOrange,
                        width: 180,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('تم النقر على ابدأ الآن!')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                children: List.generate(4, (index) {
                  return ServiceCard(
                    title: 'خدمة ${index + 1}',
                    icon: Icons.favorite,
                    color: Colors.primaries[index * 2 % Colors.primaries.length],
                  );
                }),
              ),
            ),

            const SizedBox(height: 30),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomMainButton(
                    text: 'تواصل',
                    color: Colors.blue,
                    width: 140,
                    onPressed: () {},
                  ),
                  CustomMainButton(
                    text: 'تفاصيل',
                    color: Colors.green,
                    width: 140,
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}



// زر مخصص كبير
class CustomMainButton extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final VoidCallback onPressed;

  const CustomMainButton({
    super.key,
    required this.text,
    required this.color,
    required this.width,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

// بطاقة خدمة
class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const ServiceCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color.withOpacity(0.8),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
