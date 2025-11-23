import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pet_dating/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passowrdController = TextEditingController();
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
            colors: [
              Color(0xffF7B327).withOpacity(0.1),
              Colors.white
            ])
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              Spacer(),
              Image.asset("assets/logo.png"),
                SizedBox(height: 85,),
              Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff333333),
                ),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 175,
                    decoration: BoxDecoration(
                      color: Color(0xffF7B327),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(color: Color(0xffE6DCCD), blurRadius: 20),
                      ],
                    ),
            
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Bootstrap.google,color: Colors.white,),
                        SizedBox(width: 10,),
                        Text(
                          "With Google",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Color(0xffE6DCCD)),
                    ),
                    child: Icon(Bootstrap.facebook,color: Color(0xff3F2D20),),
                  ),
            
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Color(0xffE6DCCD)),
                    ),
                    child: Icon(Bootstrap.twitter,color: Color(0xff3F2D20),),
                  ),
                ],
              ),
               SizedBox(height: 35,),
              Text(
                "Or with Email",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff73665C),
                ),
              ),
                SizedBox(height: 25,),
              customForm(
                false,
                Icon(Icons.check, size: 18, color: Colors.grey),
                TextInputType.emailAddress,
                emailController
              ),
               SizedBox(height: 15,),
              customForm(true, Padding(
             
                padding: const EdgeInsets.only(top: 12,right: 5),
                child: Text("Forgot?",style: TextStyle(
                  color: Colors.grey
                ),),
              ), TextInputType.visiblePassword,passowrdController),
               SizedBox(height: 30,),

              InkWell(
                
                onTap: (){
     
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>DogHomeScreen()));
               
                },
                child: Container(
                      height: 55,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Color(0xffEF7E06),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Color(0xffE6DCCD), blurRadius: 20),
                        ],
                      ),
                      
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
              ),
                   SizedBox(height: 65,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New Use?"),
                      Text(" Sign Up",style: TextStyle(
                        color: Color(0xffEF7E06)
                      ),)
                    ],
                  ),
                  Spacer()
            ],
          ),
        ),
      ),
    );
  }

  Widget customForm(bool obscure, Widget suffix, TextInputType type,TextEditingController controller,) {
     
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(width: 1, color: Color(0xffE6DCCD)),
    );
      
      
    return TextField(
      
      obscureText: obscure,
      keyboardType: type,
       controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(14),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: suffix,
        ),
        hintText: obscure ? "Your Passowrd" : "Your email",
        hintStyle: const TextStyle(color: Colors.black, fontSize: 14),
        filled: false,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
