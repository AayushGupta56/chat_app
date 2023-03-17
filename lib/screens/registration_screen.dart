import 'package:flutter/material.dart';
import 'package:chatapp/components/roundedButton.dart';
import 'package:chatapp/constant.dart';
import 'chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class RegistrationScreen extends StatefulWidget {
  static const String id ='Registration_Screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final  _auth=FirebaseAuth.instance;
     late String email;
    late String password;
    bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Expanded(
                flex: 6,
                child: Container(
                  // height: 8.0,
                ),
              ),
              Expanded(
                flex: 13,
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  //height: 48.0,
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email=value;
                },
                decoration:  kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email'),
              ),
              Expanded(
                flex: 1,
                child: Container(
                 // height: 8.0,
                ),
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {

                  password=value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password.'),
              ),
              // Expanded(
              //   flex: 1,
              //   child: Container(
              //     //height: 24.0,
              //   ),
              // ),
              RoundedButton(
                color: Colors.blueAccent,
                text: 'Register',
                myonpressed: ()async {
                    print(email);
                    print(password);
                    setState(() {
                      spinner=true;
                    });
                   try {

                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if(newUser!=null){
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      spinner=false;
                    });
                  }
                  catch(e){
                  print(e);
                  }
                },
              ),
              Expanded(
                flex: 9,
                child: Container(
                  // height: 8.0,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}