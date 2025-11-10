import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app_ui/home_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset("assets/draw1.png")
            ,
          ),
          Center(child: Image.asset("assets/pets.png")),
          Padding(
            padding: const EdgeInsets.only(left: 10,bottom: 10),
            child: Image.asset("assets/text_pet.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. Diam \nnunc et tincidunt ut. Vestibulum felis ",style: GoogleFonts.cairo(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Color(0xff979797),
            ),),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 35,top: 12),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFF7F48)
                  ),
                  child: Image.asset("assets/left_icon.png"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}