import 'package:animation/animated_carsoul.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E8B7C),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color(0xFFFFC400), // teal-green
              Color(0xFFFD7FA2), // warm reddish tone
            ],
          )
        ),
        child: Stack(
          children: [
           
          Positioned(
            top: 100,
            left: 140,
            right: 100,
            child: Image.asset("assets/images/logo.png")),
        
           Positioned(
            top: 280,
            right: 250,
            child: Image.asset("assets/images/pink_juice.png")),
           Positioned(
                 top: 280,
            left: 280,
            child: Image.asset("assets/images/yellow_juice.png")),
           
        
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Choose the \n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "Drink",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.yellow.shade700, // your highlight color
                            ),
                          ),
                          const TextSpan(
                            text: " you love",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                     SizedBox(height: 40,),
                    Text.rich(
                     
                      TextSpan(children: [
                         TextSpan(
                        text: "We provide a varity of fresh",
                         style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                      ),
                           TextSpan(
                        text: " juice ",
                         style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.yellow.shade700, // your highlight color
                            ),
                      ),
                           TextSpan(
                        text: "with\n",
                         style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                      ),
                           TextSpan(
                        text: "various flavors. Get fresh",
                         style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                      ),
                      
                          TextSpan(
                        text: " juice ",
                         style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.yellow.shade700, // your highlight color
                            ),
                      ),
                          TextSpan(
                        text: "easily.",
                         style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                      ),

                      ])
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>AnimatedCarouselApp()));
                      },
                      child: Container(
                        height: 70,
                        width: 340,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFFDD9718)
                        ),
                        child: Center(
                          child: Text("Get Started ", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),),
                        ),
                      ),
                    )
                  ],
                ),
              )

            ),
          )
          ],
        ),
      ),
    );
  }
}