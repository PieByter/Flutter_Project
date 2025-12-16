import 'package:flutter/material.dart';
import 'authentication/login_page.dart';
import 'package:flutter/widget_previews.dart';
import '../config/preview_config.dart';

@AppPreview(name: 'Splash Screen', group: 'Splash')
Widget splashScreenPreview() {
  return const MaterialApp(
    home: SplashScreen(skipNavigation: true),
    debugShowCheckedModeBanner: false,
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.skipNavigation = false});

  final bool skipNavigation;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _controller.forward();
    if (!widget.skipNavigation) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const LoginPage()),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Icon(Icons.fastfood, size: 100, color: Colors.green),
            ),
            const SizedBox(height: 24),
            ScaleTransition(
              scale: _animation,
              child: const Text(
                'Kantin Apps',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
