import 'package:animation/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  static const routeName = AppRoutes.onboard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1C1B1A),
              Color(0xFF2E2A10),
              Color(0xFF000000),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            // Top progress indicator
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBar(active: true),
                  _buildBar(active: false),
                  _buildBar(active: false),
                  _buildBar(active: false),
                ],
              ),
            ),

            // Solar panel + wind turbines image
            Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/home.png',
                height: 320,
                fit: BoxFit.contain,
              ).animate().fadeIn(duration: 800.ms, delay: 200.ms),
            ),

            // Text content
            Positioned(
              bottom: 200,
              left: 24,
              right: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Solar panels\n",
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFFC107),
                          ),
                        ),
                        TextSpan(
                          text: "reduce climate\nchange ",
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.bolt,
                            color: Color(0xFFFFC107),
                            size: 34,
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(duration: 600.ms),
                  const SizedBox(height: 18),
                  Text(
                    "Solar panel monitoring systems gather data\nfrom various sensors and meters installed\nwithin the solar PV system.",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      height: 1.6,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ).animate().fadeIn(duration: 800.ms, delay: 300.ms),
                ],
              ),
            ),

            // "Get Started" Button
            Positioned(
              bottom: 100,
              left: 24,
              right: 24,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.dashboard);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC107),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  elevation: 5,
                ),
                child: Text(
                  "Get Started",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ).animate().fadeIn(duration: 700.ms, delay: 400.ms),
            ),

            // Bottom indicator line
            Positioned(
              bottom: 50,
              left: 80,
              right: 80,
              child: Container(
                height: 2,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar({required bool active}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 5,
      width: 60,
      decoration: BoxDecoration(
        color: active ? const Color(0xFFFFC107) : Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
