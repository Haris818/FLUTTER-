import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Tween Animation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Modern Tween Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _sizeAnimation;
  late final Animation<Color?> _colorAnimation;
  late final Animation<BorderRadius?> _borderRadiusAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _sizeAnimation = Tween<double>(begin: 50, end: 220).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
    );

    _colorAnimation = ColorTween(begin: Colors.deepPurple.shade300, end: Colors.deepPurple.shade900).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _borderRadiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(50),
      end: BorderRadius.circular(15),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                width: _sizeAnimation.value,
                height: _sizeAnimation.value,
                decoration: BoxDecoration(
                  color: _colorAnimation.value,
                  borderRadius: _borderRadiusAnimation.value,
                  boxShadow: [
                    BoxShadow(
                      color: _colorAnimation.value!.withOpacity(0.6),
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Flutter',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: _sizeAnimation.value / 8,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
