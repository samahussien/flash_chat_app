import 'package:flash_chat/components/RoundedButton.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String errorMessage = '';
  // final GlobalKey<FormState> _key=GlobalKey<FormState>();
  bool showSpinner=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: logoHeroTag,
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(


              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,

              controller: emailController,
              onChanged: (value) {
                //Do something with the user input.
                email = value;
              },

              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),

            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,

              controller: passwordController,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),

            ),
            const SizedBox(height: 10,),Center(child: Text(errorMessage,style: const TextStyle(color: Colors.red),),),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                color: Colors.lightBlueAccent,
                label: 'Log in',
                onPress: () async {

               try{
                   await _auth.signInWithEmailAndPassword(
                       email: emailController.text, password: passwordController.text);

                   Navigator.pushNamed(context, ChatScreen.id);

errorMessage='';
               }on FirebaseAuthException
               catch(e){
                 setState(() {
                   errorMessage=e.message.toString();

                 });
                 print(e);
               }
                }),
          ],
        ),
      ),

    );
  }
}
