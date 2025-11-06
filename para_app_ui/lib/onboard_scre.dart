import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7E8E3),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/bg.png",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24,top: 130,bottom: 80,right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: GoogleFonts.poppins(
                    fontSize: 56,
                    color: const Color(0xff2D6936),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  "We’re glad that\nyou are here!",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    color: const Color(0xff2D6936),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Spacer(),
                //buttonW(tital: 'Get Started',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// Example placeholder for next screen:
class OnboardScreen2 extends StatelessWidget {
  const OnboardScreen2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE7E8E3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 130,bottom: 80),
          child: Center(
            child: Column(
             children: [
               Image.asset("assets/bg2.png",fit: BoxFit.fitWidth,),
               SizedBox(height: 80,),
               Text("Discover Your Type \nof Plant",
               textAlign: TextAlign.center,
               style: GoogleFonts.poppins(
                 fontSize: 30,
                 color: Color(0xff2D6936),
                 fontWeight: FontWeight.bold,
               
               ),),
               SizedBox(height: 30,),
               Text("Tips N Tricks to grow a \nhealthy plant",
               textAlign: TextAlign.center,
               style: GoogleFonts.poppins(
                 fontSize: 24,
                 color: Color(0xff2D6936),
                 fontWeight: FontWeight.normal,
               ),),
              Spacer(),
              // Padding(
              //   padding: const EdgeInsets.only(right: 24),
              //   child: buttonW(tital: 'Continue',),
              // ),
             ],
            ),
          ),
        ),
      ),
    );
  }
}
class OnboardScreen3 extends StatelessWidget {
  const OnboardScreen3 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE7E8E3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50,bottom: 80),
          child: Center(
            child: Column(
             children: [
               Image.asset("assets/bg3.png"),
               SizedBox(height: 80,),
               Text("Connect With Other \nPlant Lovers",
               textAlign: TextAlign.center,
               style: GoogleFonts.poppins(
                 fontSize: 30,
                 color: Color(0xff2D6936),
                 fontWeight: FontWeight.bold,
               
               ),),
               SizedBox(height: 30,),
               Text("Join A Community",
               textAlign: TextAlign.center,
               style: GoogleFonts.poppins(
                 fontSize: 24,
                 color: Color(0xff2D6936),
                 fontWeight: FontWeight.normal,
               ),),
              Spacer(),
              // Padding(
              //   padding: const EdgeInsets.only(right: 24),
              //   child: buttonW(tital: 'Continue',),
              // ),
             ],
            ),
          ),
        ),
      ),
    );
  }
}
