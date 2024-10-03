import 'dart:ui';
import 'package:blog/src/feature/home/views/home1.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../res/colors.dart';

class Home2 extends StatefulWidget {
  static const routePath = "/home2";
  const Home2({super.key});

  @override
  State<Home2> createState() => _HomeState();
}

class _HomeState extends State<Home2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _bottumAnimation;
  late Animation<Offset> _leftAnimation;
  late Animation<Offset> _rightAnimation;
  double opacity = 1.0;
  double scale = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // animate from bottom
    _bottumAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // animate from left
    _leftAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Start off-screen to the left
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // animate from right
    _rightAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Start off-screen to the right
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Automatically start the animation when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      // Increase the scale to make the logo larger
      scale = 2; // Adjust this value for the desired size
    });

    // Wait for the animation to finish and then navigate
    Future.delayed(const Duration(milliseconds: 00), () {
      // Navigate to Home1
      // ignore: use_build_context_synchronously
      context.go(Home1.routePath);
    });
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
      // Determine if the screen is wide enough for the horizontal layout
      bool isWideScreen = constraints.maxWidth > 600; // You can adjust this threshold

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
                // First vector effect
                Positioned(
                  top: 550.43,
                  left: 184.24,
                  child: Stack(
                    children: [
                      Container(
                        width: 1462.01,
                        height: 414.26,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF3C78B),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(829.6),
                          ),
                        ),
                      ),
                      BackdropFilter(
                        filter:
                            ImageFilter.blur(sigmaX: 165.92, sigmaY: 165.92),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                // Second vector effect
                Positioned(
                  top: 310.01,
                  left: 78.71,
                  child: Stack(
                    children: [
                      Container(
                        width: 1673.07,
                        height: 531.81,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE48F4C),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(829.6),
                          ),
                        ),
                      ),
                      BackdropFilter(
                        filter:
                            ImageFilter.blur(sigmaX: 165.92, sigmaY: 165.92),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                // Third vector effect
                Positioned(
                  top: 227,
                  left: 56.73,
                  child: Stack(
                    children: [
                      Container(
                        width: 1673.07,
                        height: 931.81,
                        decoration: const BoxDecoration(
                          color: Color(0xFF612B10),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(829.6),
                          ),
                        ),
                      ),
                      BackdropFilter(
                        filter:
                            ImageFilter.blur(sigmaX: 165.92, sigmaY: 165.92),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                // Animated logo
                Positioned(
                  top: 103.15,
                  left: 640,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 2000),
                    opacity: opacity,
                    child: SlideTransition(
                      position: _bottumAnimation,
                      child: Center(
                        child: Transform.scale(
                          scale: scale,
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.cover,
                            width: 170,
                            height: 36.33,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Animated text "Unlock Seamless Efficiency"
                Positioned(
                  top: 133.15,
                  left: 416,
                  child: SlideTransition(
                    position: _bottumAnimation,
                    child: const Text(
                      "Unlock Seamless \nEfficiency",
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 80,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.02,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // Animated button "Join Waitlist"
                Positioned(
                  top: 360.15,
                  left: 686.5,
                  child: SlideTransition(
                    position: _bottumAnimation,
                    child: Container(
                      width: 167,
                      height: 52,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(52),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.61),
                            blurRadius: 30,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Join Waitlist",
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.02,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // First  scrolling from left
                Positioned(
                  top: 250,
                  left: 0, 
                  child: SlideTransition(
                    position: _leftAnimation, 
                    child: Image.asset(
                      'assets/images/Event.png', 
                      width: 214.46,
                      height: 278,
                    ),
                  ),
                ),
                // Text next to the 
                Positioned(
                  top: 250, 
                  left: -10, 
                  child: SlideTransition(
                    position: _leftAnimation,
                    child: const Text(
                      "Renew Car insurance",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                // Second image scrolling from left
                Positioned(
                  top: 0, 
                  left: 200, 
                  child: SlideTransition(
                    position: _leftAnimation, 
                    child: Image.asset(
                      'assets/images/Card.png', 
                      width: 214.46,
                      height: 150,
                    ),
                  ),
                ),
                // bottom animated1  
                Positioned(
                  bottom: 0,
                  left: 262, 
                  child: SlideTransition(
                    position: _bottumAnimation,
                    child: Image.asset(
                      'assets/images/tickets_card.png', 
                      fit: BoxFit.cover,
                      width: 200, 
                      height: 100, 
                    ),
                  ),
                ),
                //  animated  text from bottom
                Positioned(
                  bottom: 120,
                  left: 298, 
                  child: SlideTransition(
                    position: _bottumAnimation,
                    child: Container(
                      width: 200.31, 
                      height: 51.15,
                      padding: const EdgeInsets.symmetric(
                          vertical: 13.08, horizontal: 26.15),
                      decoration: BoxDecoration(
                        color: const Color(
                            0xFF6464644D), // Background color with opacity
                        borderRadius:  BorderRadius.circular(31.38),
                          
                        border: Border.all(
                          color: const Color(
                              0x1AFFFFFF), // Border color with opacity
                          width: 1, // Border width
                        ),
                      ),
                      child: const Text(
                        "Cafe nearby", // Adjust text as needed
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.02,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                 // bottom animated  image2
                Positioned(
                  bottom: 10,
                  left: 1000, // Adjust as needed
                  child: SlideTransition(
                    position: _bottumAnimation,
                    child: Image.asset(
                      'assets/images/Reservation.png',
                      fit: BoxFit.cover,
                      width: 268, 
                      height: 200, 
                    ),
                  ),
                ),
                //  animated  text from right
                Positioned(
                  bottom: 230,
                  right: 50,
                  child: SlideTransition(
                    position: _rightAnimation,
                    child: Container(
                      width: 170.31, 
                      height: 51.15, 
                      padding: const EdgeInsets.symmetric(
                          vertical: 13.08, horizontal: 20.15),
                      decoration: BoxDecoration(
                        color: const Color(
                            0xFF6464644D), 
                        borderRadius:  BorderRadius.circular(31.38),
                          
                        border: Border.all(
                          color: const Color(
                              0x1AFFFFFF), 
                          width: 1, 
                        ),
                      ),
                      child: const Text(
                        "Trip Ideas",
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.02,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                //  animated  text from right
                Positioned(
                  bottom: 290,
                  right: 20, 
                  child: SlideTransition(
                    position: _rightAnimation,
                    child: Container(
                      width: 200.31, 
                      height: 51.15,
                      padding: const EdgeInsets.symmetric(
                          vertical: 13.08, horizontal: 26.15),
                      decoration: BoxDecoration(
                        color: const Color(
                            0xFF6464644D),
                        borderRadius:  BorderRadius.circular(31.38),
                          
                        border: Border.all(
                          color: const Color(
                              0x1AFFFFFF),
                          width: 1, 
                        ),
                      ),
                      child: const Text(
                        "Book a flight", 
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.02,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
               //  animated   from right1
               Positioned(
                  bottom: 350,
                  right: 50, 
                  child: SlideTransition(
                    position: _leftAnimation, 
                    child: Image.asset(
                      'assets/images/Event.png', 
                      width: 200.46,
                      height: 130,
                    ),
                  ),
                ),
                //  animated   from right2
                Positioned(
                    top: 0, 
                  right: 200,  
                  child: SlideTransition(
                    position: _leftAnimation, 
                    child: Image.asset(
                      'assets/images/to.png', 
                      width: 200.46,
                      height: 100,
                    ),
                  ),
                ),
 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
