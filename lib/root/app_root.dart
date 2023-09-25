import 'package:flutter/material.dart';
import 'package:thurs/screens/login_screen.dart';
import 'package:thurs/screens/register.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      // home: RegisterScreen(),
      // home: HomeScreen(),
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
