import 'package:flutter/material.dart';
import 'package:musicplayer2/Components/reusable_textfield.dart';
import 'package:musicplayer2/screens/app.dart';
import 'package:musicplayer2/screens/login.dart';
import 'package:musicplayer2/screens/signup.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  TextEditingController _nameInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black,
              const Color.fromARGB(255, 39, 39, 39)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 140,
                          ),
                          Text(
                            "Millions of Songs on",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              "SANGEET",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    signInSignUpButton(context, "Sign up Free", _signInUser),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 400,
                            child: ElevatedButton(
                              
                              onPressed: () {
                                // Add your Google Sign-In logic here
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white, // Background color
                                onPrimary: Colors.black, // Text color
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/google_logo.png', // Add your Google logo image asset
                                    height: 36.0,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Sign in with Google',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20),),
                        ),
                        SizedBox(width: 25,)
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  _signInUser() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Signup()));
  }
}
