import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:para_app_ui/onboard_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds:3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnboardMain()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff447055),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("GO",style: GoogleFonts.poppins(
              fontSize: 64,
              color: Colors.white24,
              fontStyle: FontStyle.italic
            )),
            Text(" GREEN",style: GoogleFonts.poppins(
              fontSize: 64,
              color: Color(0xff99DAB3),
              fontStyle: FontStyle.italic
            ),),
          ],
        ),
      ),
    );
}
}