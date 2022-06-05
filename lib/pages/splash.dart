import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import './homePage.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => homePage()));
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Lottie.asset(
                "assets/contacts.json"
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Contacts Loading ... ",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Brand Bold"
                  ),
                ),
              const SizedBox(
                height: 40,
              ),

            const CircularProgressIndicator(
              backgroundColor: Colors.black,
              strokeWidth:2,
            )
            ],

          )
        ),
    );  
  }
}