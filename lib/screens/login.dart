
import 'package:flutter/material.dart';
import 'package:musicplayer2/Components/reusable_textfield.dart';
import 'package:musicplayer2/screens/app.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  void initState() {
    super.initState();
    print("Checked Logged In");
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyApp()));
      }
    });
  }


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
                          SizedBox(height: 100,),
                          Text("Sign in", style: TextStyle(color: Colors.white, fontSize: 30),),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an Account ?", style: TextStyle(color: Color.fromARGB(255, 185, 185, 185), fontSize: 15),),
                              SizedBox(width: 5,),
                              Text("Sign Up", style: TextStyle(color: Color.fromARGB(255, 0, 251, 67), fontSize: 15),)
                            ],
                          )
                          
                        ],
                      ),
                    ),
                    
                    reusableTextField("E-mail", Icons.email_outlined, false,
                        _emailInputController),
                        SizedBox(height: 50,),
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
                      SizedBox(height: 20,),
                      signInSignUpButton(context, "Sign In", _signInUser),
                      SizedBox(height: 30,),
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
                            SizedBox(height: 30),
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

  _signInUser() {
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailInputController.text, password: _passwordInputController.text)
                  .then((value) {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> const MyApp())); // Navigate back
                  })
                  .onError((error, stackTrace) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Error"),
                          content: Text(error.toString()),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  });
                }
}
