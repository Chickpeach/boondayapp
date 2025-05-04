import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:boonday/watchonglom.dart';
import 'package:boonday/wathuarumpong.dart';
import 'package:boonday/watyannawa.dart';
import 'package:boonday/routes/app_routes.dart'; // Import AppRoutes

void main() {
  runApp(const MakeMeritApp());
}

class MakeMeritApp extends StatelessWidget {
  const MakeMeritApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MakeMeritMainPage(),
    );
  }
}

class MakeMeritMainPage extends StatelessWidget {
  const MakeMeritMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ScrollController scrollController = ScrollController();

    double buttonWidth = kIsWeb ? 400 : size.width * 0.7;
    double buttonHeight = kIsWeb ? 120 : size.width * 0.3;
    double maxWidth = kIsWeb ? 600 : double.infinity;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: kIsWeb
                ? Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 600,
                    child: Scrollbar(
                      controller: scrollController,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _buildContent(buttonWidth, buttonHeight, context),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0, // ให้ scrollbar ชิดขวาสุด
                  top: 0,
                  bottom: 0,
                  child: SizedBox(
                    width: 12,
                    child: Scrollbar(
                      controller: scrollController,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Container(), // ป้องกัน error โดยใช้ empty container
                      ),
                    ),
                  ),
                ),
              ],
            )
                : _buildMobileLayout(context, size),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Image.asset('assets/icons/cart.png', width: 28, height: 28),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.cart); // Navigate to CartScreen
          },
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, Size size) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildContent(size.width * 0.7, size.width * 0.3, context),
      ),
    );
  }

  List<Widget> _buildContent(double buttonWidth, double buttonHeight, BuildContext context) {
    return [
      const SizedBox(height: 80),
      _buildHeaderText('จะมูให้แม่น!', 60),
      const SizedBox(height: 12),
      _buildHeaderText('ต้องเริ่มวัดที่ใช่', 52),
      const SizedBox(height: 24),
      _buildSubHeaderText('เลือกวัดที่ต้องการทำบุญ'),
      const SizedBox(height: 30),
      BounceButton(
        imagePath: 'assets/images/watone.png',
        width: buttonWidth,
        height: buttonHeight,
        text: 'วัดหัวลำโพง',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Wathuarumpong()),
          );
        },
      ),
      const SizedBox(height: 20),
      BounceButton(
        imagePath: 'assets/images/wattwo.png',
        width: buttonWidth,
        height: buttonHeight,
        text: 'วัดยานนาวา',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WatYannawa()),
          );
        },
      ),
      const SizedBox(height: 20),
      BounceButton(
        imagePath: 'assets/images/watthree.png',
        width: buttonWidth,
        height: buttonHeight,
        text: 'วัดช่องลม',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WatChongLom()),
          );
        },
      ),
    ];
  }

  Widget _buildHeaderText(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'NotoSansThai',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubHeaderText(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.green.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'NotoSansThai',
          fontSize: 28,
          color: Colors.green.shade900,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(widget.imagePath, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(widget.text, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
      ],
    );
  }
}