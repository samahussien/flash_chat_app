import 'package:flash_chat/components/RoundedButton.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/sharedFunctions.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  const RegistrationScreen({super.key});
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;  String errorMessage = '';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
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
              TextField(              controller: emailController,

                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                textAlign: TextAlign.center,              controller: passwordController,

                obscureText: true,
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Password'),
              ),            const SizedBox(height: 10,),Center(child: Text(errorMessage,style: const TextStyle(color: Colors.red),),),

              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  color: Colors.blueAccent,
                  label: 'Register',
                  onPress: () async {

                    try {
                       await _auth.createUserWithEmailAndPassword(
                          email: emailController.text, password: passwordController.text);
                      Navigator.pushNamed(context, ChatScreen.id);
clearController(emailController: emailController, passwordController: passwordController);
                      errorMessage='';

                    } on FirebaseAuthException
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
      ),
    );
  }
}
