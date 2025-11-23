import 'package:flutter/material.dart';
import 'package:pet_dating/login_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background gradient / image
          Positioned.fill(
            child: Image.asset(
              "assets/bg1.png",
              fit: BoxFit.cover,
            ),
          ),

          // Small hearts background overlay
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/bg2.png",
              width: 250,
            ),
          ),

          // TEXT AREA
          Positioned(
            top: 150,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Let’s do\nsomething together",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  textAlign: TextAlign.center,
                  "Meet local dogs and dog lovers for \nfriendship, play-dates or fun outdoor playing.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 50),

                // BUTTON
                GestureDetector(
                  onTap: () {
                    
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      
                      shape: BoxShape.circle,
                      color: Color(0xffF3A723),
                      gradient: LinearGradient(
                        begin: AlignmentGeometry.bottomLeft,
                        end: AlignmentGeometry.topRight,
                        colors: [
                         Color(0xffEF7E06),
                         Color(0xffF7B327)
                      ])
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // DOG IMAGE (bottom right)
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/dog.png",
            
            ),
          ),
        ],
      ),
    );
  }
}
