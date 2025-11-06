import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:para_app_ui/onboard_scre.dart';

class OnboardMain extends StatefulWidget {
  const OnboardMain({super.key});

  @override
  State<OnboardMain> createState() => _OnboardMainState();
}

class _OnboardMainState extends State<OnboardMain> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = const [
    OnboardScreen(),
    OnboardScreen2(),
    OnboardScreen3(),
  ];
  final List<String> _buttonTexts = [
    "Get Started",
    "Continue",
    "Create Account",
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Move to next screen (e.g., Login or Home)
      print("Onboarding Complete!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) => _pages[index],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 120,
                    bottom: 70,
                    right: 24,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (_currentPage < _pages.length - 1) {
                        _nextPage();
                      } 
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff47734D).withOpacity(0.85),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          _buttonTexts[_currentPage],
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 12,
                      width: _currentPage == index ? 60 : 35,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Color(0xff37623D)
                            : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Dots Indicator + Buttons
        ],
      ),
    );
  }
}
