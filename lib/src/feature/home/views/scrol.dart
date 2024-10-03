import 'dart:async';
import 'package:flutter/material.dart';
import '../../../res/colors.dart';

class ScrollPage extends StatefulWidget {
  static const routePath = "/scroll";
  const ScrollPage({super.key});

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;
  final List<String> _imagePaths = [
    'assets/images/h1.png', // Image 1
    'assets/images/h2.png', // Image 2
    'assets/images/h3.png', // Image 3
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    // Set up a timer to auto-scroll every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _currentPage++;
      if (_currentPage >= _imagePaths.length) {
        _currentPage = 0; // Loop back to the first image
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel(); // Cancel the timer when disposing the state
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen width and height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Calculate width based on screen width
    double calculatedWidth(double percentage) => screenWidth * percentage;
    // Calculate font size based on screen width
    double calculatedFontSize(double fontSize) => fontSize * screenWidth / 375;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                "Fluid AI was born out of a\n desire to simplify and\n streamline modern life",
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: calculatedFontSize(30), // Adjusted font size
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.02,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // First section with image and text
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  // Text on the left
                  SizedBox(
                    width: calculatedWidth(0.4), // 40% of screen width
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Fluid AI: Simplify, Organize, and Achieve More",
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            height: 1,
                            letterSpacing: -0.02,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Opacity(
                          opacity: 0.5,
                          child: Text(
                            "In a world where daily tasks, communication, and goals often become overwhelming, Fluid AI offers an innovative solution. Combining advanced AI technology with a user-friendly interface, it brings together to-do lists, chats, saved items, and bucket lists into one seamless platform.",
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                              letterSpacing: -0.02,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Image on the right
                  SizedBox(
                    width: calculatedWidth(0.4), // 40% of screen width
                    child: Image.asset(
                      'assets/images/1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Second section with image and text
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  // Image on the left
                  SizedBox(
                    width: calculatedWidth(0.4), // 40% of screen width
                    child: Image.asset(
                      'assets/images/1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Text on the right
                  SizedBox(
                    width: calculatedWidth(0.4), // 40% of screen width
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Fluid AI: Simplify, Organize, and Achieve More",
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            height: 1,
                            letterSpacing: -0.02,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Opacity(
                          opacity: 0.5,
                          child: Text(
                            "In a world where daily tasks, communication, and goals often become overwhelming, Fluid AI offers an innovative solution. Combining advanced AI technology with a user-friendly interface, it brings together to-do lists, chats, saved items, and bucket lists into one seamless platform.",
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                              letterSpacing: -0.02,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Horizontal PageView for images
              SizedBox(
                height: screenHeight * 0.5, // Adjust height as needed
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _imagePaths.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      _imagePaths[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  // Text on the left
                  SizedBox(
                    width: calculatedWidth(0.3), // 30% of screen width
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "What can curiosity,\n wonder, and awe\n do for you?",
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            height: 1,
                            letterSpacing: -0.02,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Opacity(
                          opacity: 0.5,
                          child: Text(
                            "Research shows that experiencing curiosity and awe can immensely benefit our mental, physical, and professional health. Here’s a brief overview of what curiosity and awe can do for you.",
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                              letterSpacing: -0.02,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Image on the right
                  SizedBox(
                    width: calculatedWidth(0.6), // 60% of screen width
                    child: Image.asset(
                      'assets/images/Frame.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Container(
                width: screenWidth,
                height: 740,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Join.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
