import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'blessing_select_page.dart';
import 'fortune_boost_page.dart' as fortune_boost;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BlessingMainPage(),
    );
  }
}

class BlessingMainPage extends StatelessWidget {
  const BlessingMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double buttonWidth = kIsWeb ? size.width * 0.5 : size.width * 0.7;
    double buttonHeight = kIsWeb ? size.width * 0.2 : size.width * 0.3;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/back.png', // แทนที่ด้วย path ที่ถูกต้องของ back.png
            width: 35,
            height: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            color: Colors.black87,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80), // เพิ่มพื้นที่ว่างด้านล่าง
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ขอเบา ๆ',
                            style: TextStyle(
                              fontFamily: 'NotoSansThai',
                              fontSize: kIsWeb ? 60 : 36, // ขยายหัวข้อให้ใหญ่ขึ้น
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'แต่ได้หนัก ๆ',
                            style: TextStyle(
                              fontFamily: 'NotoSansThai',
                              fontSize: kIsWeb ? 52 : 32, // ขยายหัวข้อให้ใหญ่ขึ้น
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'เสริมพลัง ปลอดภัย อุ่นใจทุกวัน',
                              style: TextStyle(
                                fontFamily: 'NotoSansThai',
                                fontSize: kIsWeb ? 28 : 20, // ข้อความกลางใหญ่ขึ้น
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 48),
                          BounceButton(
                            imagePath: 'assets/images/blessing.png',
                            width: buttonWidth,
                            height: buttonHeight,
                            text: 'ขอพร เสริมดวงประจำวัน',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const BlessingSelectPage()),
                              );
                            },
                          ),
                          const SizedBox(height: 32),
                          BounceButton(
                            imagePath: 'assets/images/personal_luck_boost.png',
                            width: buttonWidth,
                            height: buttonHeight,
                            text: 'ของดีประจำตัว',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const fortune_boost.FortuneBoostPage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BounceButton extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;

  const BounceButton({
    Key? key,
    required this.imagePath,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BounceButton> createState() => _BounceButtonState();
}

class _BounceButtonState extends State<BounceButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: () => _controller.reverse(),
          child: Transform.scale(
            scale: 1 - _animation.value,
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          widget.text,
          style: TextStyle(
            fontFamily: 'NotoSansThai',
            fontSize: kIsWeb ? 24 : 20, // ตัวหนังสือใต้ปุ่มใหญ่ขึ้น
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}