import 'package:chatapp/constant.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/roundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final _auth= FirebaseAuth.instance;
  late String email;
  late String password;
   bool spinner=false;
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
            children: [
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
              RoundedButton(
                color: Colors.lightBlueAccent,
                text: 'Log In',
                myonpressed: ()async {
                  print(email);
                  print(password);
                  setState(() {
                    spinner=true;
                  });
                 try {

                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
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
