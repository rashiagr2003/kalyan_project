import 'dart:async';
import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'features/Auth/create_account_screen.dart'; // Import colors file

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // Start animation
    _controller.forward();

    // Navigate to Home Screen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (_) =>
                CreateAccountScreen()), // Replace with your actual screen
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/background_img.png', // Use the provided background image
            fit: BoxFit.cover,
          ),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Project Logo (Optional)
                  Icon(
                    Icons
                        .anchor, // Example icon; replace with logo if available
                    color: AppColors.textWhite,
                    size: 80,
                  ),
                  SizedBox(height: 20),
                  // Project Name
                  Text(
                    "Kalyan",
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fontFamily: 'Montserrat', // Replace with chosen font
                    ),
                  ),
                  SizedBox(height: 10),
                  // Optional Tagline
                  Text(
                    "A New Wave of Experience",
                    style: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
