import 'package:boonday/watchonglom.dart';
import 'package:boonday/wathuarumpong.dart';
import 'package:boonday/watyannawa.dart';
import 'fortune_boost_page.dart' as fortune_boost;

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


    return Scaffold(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
              children: [
                  ),
                ),
                Positioned(
          onPressed: () {},
        ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
      ),
      const SizedBox(height: 12),
      const SizedBox(height: 24),
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}