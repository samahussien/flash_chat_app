import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id:(context)=> const WelcomeScreen(),
        LoginScreen.id:(context)=>const LoginScreen(),
        RegistrationScreen.id:(context)=>const RegistrationScreen(),
       ChatScreen.id:(context)=>const ChatScreen(),
      },
      darkTheme:  ThemeData.dark().copyWith(

        textTheme: const TextTheme(

          bodyText1: TextStyle(color: Colors.black54,
            fontSize: 40.0,
            fontWeight: FontWeight.w900,),
        ),
      ),
      themeMode:ThemeMode.light,
        theme: ThemeData(
          textTheme: const TextTheme(

            bodyText1: TextStyle(color: Colors.black54,
              fontSize: 40.0,
              fontWeight: FontWeight.w900,),
          ),
        ),
      // home: WelcomeScreen(),
    );
  }
}

