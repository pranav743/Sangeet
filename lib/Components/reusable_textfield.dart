import 'package:flutter/material.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide.none,
      ),
    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(BuildContext context, String text, Function onTap){

  return Container(

    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),

    
    child: ElevatedButton(

      onPressed: (){
        onTap();
      },
      
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states){
          if (states.contains(MaterialState.pressed)){
            return
              Color.fromARGB(199, 55, 255, 0);
            
          }
          return Color.fromARGB(199, 55, 255, 0);

        }),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
      ),


      child: Text(
        text, 
        style: const TextStyle(
          color: Colors.black,
           fontWeight: FontWeight.bold, fontSize: 16
        ),
        
      ),


    ),
  );
}

