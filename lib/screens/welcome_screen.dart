import 'package:flash_chat/components/RoundedButton.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'WelcomeScreen';

  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    // animation =
    //     ColorTween(end: Colors.red, begin: Colors.blue).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

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
            Row(
              children: <Widget>[
                Hero(
                  tag: logoHeroTag,
                  child: SizedBox(
                      height: controller.value*60,
                      child: Image.asset('images/logo.png'),),
                ),
                DefaultTextStyle(
                  style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w900,color: Colors.black45),
                  child: AnimatedTextKit(
                      animatedTexts: [TypewriterAnimatedText('Flash Chat')]),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                color: Colors.lightBlueAccent,
                label: 'Log In',
                onPress: () {
                  // Navigate to the second screen using a named route.
                  Navigator.pushNamed(context, LoginScreen.id);

                  //Go to login screen.
                }),
            RoundedButton(
                color: Colors.blueAccent,
                label: 'Register',
                onPress: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}


