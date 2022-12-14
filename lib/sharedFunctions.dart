import 'package:flutter/cupertino.dart';

void clearController({required TextEditingController emailController,required TextEditingController passwordController}){
  emailController.clear();
  passwordController.clear();
}
