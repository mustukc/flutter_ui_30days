import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pod_cast_app/home_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset("assets/logo.png"),
               Spacer(),
               Image.asset("assets/headphone.png"),
               Spacer(),
               Text(
          
                "Listen to your \favourite podcast",
                 textAlign: TextAlign.center,
                style: GoogleFonts.publicSans(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: Colors.black
               ),),
            
              Text(
          
                "More than 1000+ best talks ever",
                 textAlign: TextAlign.center,
                style: GoogleFonts.publicSans(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.black
               ),),
               Spacer(),
               Container(
                width: 280,
                height: 65,
                decoration: BoxDecoration(
                  color: Color(0xFF4C0099),
                  borderRadius: BorderRadius.circular(32),
                  
                ),
                child: Center(
                  child: Text("Sign in",style: GoogleFonts.publicSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white
                  ),)
                  ),
               ),
               SizedBox(height: 20,),
               GestureDetector(
                 onTap: () {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                 },
                 child: Text("Guest User",style: GoogleFonts.publicSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xFF4C0099)
                    ),),
               ),
               Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}