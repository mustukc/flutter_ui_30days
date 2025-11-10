import 'package:flutter/material.dart';
import 'package:pet_app_ui/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>OnboardScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset("assets/draw1.png",)
          ),
       
          Spacer(),
          Image.asset("assets/app_name.png",width: 345,height: 324,),
          SizedBox(height: 25,),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset("assets/draw2.png",fit: BoxFit.fill,),
          )
        ],
      ),
    );}
}