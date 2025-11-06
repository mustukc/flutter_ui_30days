import 'package:burger_app/my_bottom_bar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Image.asset("assets/bg.jpg", fit: BoxFit.cover),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.05),
                Center(
                  child: Text(
                    "             👑",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Center(
                  child: Text(
                    "BURGER \nQUEEN",
                    style: TextStyle(
                      height: 0.9,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.53),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Good Food \nTasty Food *",
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 43,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 191, 155, 45),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      InkWell(
                        onTap: () {
                          
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const MyBottomBar()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber[900],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(14),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height*0.02,),
                      Row(
                        children: [
                          Text(
                            "Dont have an account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            " Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              decorationColor: Colors.white
                              ),

                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
