import 'package:flutter/material.dart';
import 'package:googlesignin/screens/home.dart';
import 'package:googlesignin/services/firebase_screens.dart';
import 'package:googlesignin/utils/colors_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        hexStringToColour("CB2B93"),
        hexStringToColour("9546C4"),
        hexStringToColour("5E61F4")
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              onPressed: () async{
                await FirebaseServices().signInWithGoogle();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
              })),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Image.asset("assets/images/google.png",width: 40,height: 40,),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Login with Gmail",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    ));
  }
}
