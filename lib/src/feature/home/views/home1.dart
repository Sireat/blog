import 'dart:ui';
import 'package:blog/src/feature/home/views/home2.dart';
import 'package:blog/src/feature/home/views/scrol.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../res/colors.dart';

class Home1 extends StatefulWidget {
  static const routePath = "/home1";
  const Home1({super.key});

  @override
  State<Home1> createState() => _HomeState();
}

class _HomeState extends State<Home1> {
  double scale = 1.0;

  void _onTap() {
    setState(() {
      scale = 0.2;
    });

    Future.delayed(const Duration(milliseconds: 1000), () {
      // ignore: use_build_context_synchronously
      context.go(Home2.routePath);
    });
  }

  void _onScrollDownTap() {
    // Navigate to the scroll page (scrol.dart)
    context.go(ScrollPage.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
  automaticallyImplyLeading: false,
  backgroundColor: AppColors.black,
  title: LayoutBuilder(
    builder: (context, constraints) {
      
      bool isWideScreen = constraints.maxWidth > 600; 

      return isWideScreen
          ? const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Our story',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'The waitlist',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'What we believe',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Our features',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            )
          : const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stack the two rows vertically on narrow screens
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Our story',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      'What we believe',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10), // Add some vertical spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'The waitlist',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      'Our features',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            );
    },
  ),
),

      body: Stack(
        children: [
          GestureDetector(
            onTap: _onTap,
            child: Stack(
              children: [
                // Vector effects and logo
                Positioned(
                  top: 570.43,
                  left: 184.24,
                  child: Container(
                    width: 1462.01,
                    height: 814.26,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF3C78B),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(829.6),
                        topRight: Radius.zero,
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 165.92, sigmaY: 165.92),
                      child: Opacity(opacity: 0, child: Container()),
                    ),
                  ),
                ),
                Positioned(
                  top: 710.01,
                  left: 78.71,
                  child: Container(
                    width: 1673.07,
                    height: 931.81,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE48F4C),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(829.6),
                        topRight: Radius.zero,
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 165.92, sigmaY: 165.92),
                      child: Opacity(opacity: 0, child: Container()),
                    ),
                  ),
                ),
                Positioned(
                  top: 527,
                  left: 56.73,
                  child: Container(
                    width: 1673.07,
                    height: 931.81,
                    decoration: const BoxDecoration(
                      color: Color(0xFF612B10),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(829.6),
                        topRight: Radius.zero,
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 165.92, sigmaY: 165.92),
                      child: Opacity(opacity: 0, child: Container()),
                    ),
                  ),
                ),
                Center(
                  child: AnimatedScale(
                    scale: scale,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                      width: 840,
                      height: 179,
                    ),
                  ),
                ),
                const SizedBox(height: 500),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: _onScrollDownTap, 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 18,
                    height: 27.82,
                    child: Opacity(
                      opacity: 1.0,
                      child: Image.asset(
                        'assets/images/scroll.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4.09),
                  const Text(
                    'Scroll down',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.01,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
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
