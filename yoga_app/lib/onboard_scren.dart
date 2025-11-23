import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoga_app/home_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffF3F8F6),
              Color(0xffECF3F1),
            ],
          ),
        ),
       
          child: Column(
            children: [

              const SizedBox(height: 150),

              // TITLE TOP
              Text(
                "Have the best",
                style: GoogleFonts.playfairDisplay(
                  fontSize: 30,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "Yoga Experience",
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 18),

              // SUBTITLE
              Text(
                "Transform your body and mind with our\n"
                "comprehensive yoga app. Discover expert-led\n"
                "classes, personalized routines",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.7,
                ),
              ),

              const SizedBox(height: 40),

              // BUTTON
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const YogaHomeScreen()));
                },
                child: Container(
                  height: 60,
                  width: 230,
                  decoration: BoxDecoration(
                    color: const Color(0xffF28B63),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Start Journey",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // BOTTOM IMAGE
              Image.asset(
                "assets/yoga_onboard.png",
                fit: BoxFit.fitHeight,
                height: 500,
                width: 1000,
              ),

             
            ],
          ),
        ),
      
    );
  }
}
