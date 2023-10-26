
import 'package:flutter/material.dart';
import 'package:musicplayer2/Components/reusable_textfield.dart';
import 'package:musicplayer2/screens/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                      height: 200,
                      child: Column(
                        children: [
                          SizedBox(height: 80,),
                          Text("Register", style: TextStyle(color: Colors.white, fontSize: 30),),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account ?", style: TextStyle(color: Color.fromARGB(255, 185, 185, 185), fontSize: 15),),
                              SizedBox(width: 5,),
                              Text("Sign in", style: TextStyle(color: Color.fromARGB(255, 0, 251, 67), fontSize: 15),)
                            ],
                          )
                        ],
                      ),
                    ),
                    reusableTextField("Name", Icons.supervised_user_circle_outlined, false,
                        _nameInputController),
                        SizedBox(height: 20,),
                    reusableTextField("E-mail", Icons.email_outlined, false,
                        _emailInputController),
                        SizedBox(height: 20,),
                    reusableTextField("Password", Icons.key_outlined, true,
                        _passwordInputController),
                    
                        SizedBox(height: 15,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          
                          children: [
                            Text("Forgot your Password ?", style: TextStyle(color: Colors.white, fontSize: 12),),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      signInSignUpButton(context, "Sign Up", _signInUser),
                      SizedBox(height: 25,),
                      Divider(color: Colors.white,),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: 350,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your Google Sign-In logic here
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white, // Background color
                                  onPrimary: Colors.black, // Text color
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Future<void> _signInUser() async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailInputController.text,
        password: _passwordInputController.text,
      );

      // final user = userCredential.user;
      // if (user != null) {
      //   final users = FirebaseFirestore.instance.collection('users');
      //   await users.doc(user.uid).set({
      //     'name': _nameInputController.text,
      //   });
      // }

      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black, // Set a dark background color
            title: Text(
              "Error",
              style: TextStyle(
                color: Colors.white, // Set text color to white
              ),
            ),
            content: Text(
              error.toString(),
              style: TextStyle(
                color: Colors.white, // Set text color to white
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 33, 243, 40), // Set a contrasting color for the button
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

}
