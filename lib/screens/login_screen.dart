import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thurs/screens/home_screen.dart';
import 'package:thurs/screens/register.dart';
import 'package:image_picker/image_picker.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  //SharedPreferences
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 390,
              height: 60,
              margin: EdgeInsets.only(top: 30),
              child: TextFormField(
                controller: emailController,
                maxLines: 5,
                minLines: 1,
                maxLength: 50,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.person),
                    // hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Container(
              width: 390,
              height: 60,
              margin: EdgeInsets.only(top: 30),
              child: TextFormField(
                controller: passwordController,
                maxLines: 5,
                minLines: 1,
                maxLength: 10,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.password),
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
              child: Text("Login"),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ));
              },
              child: Text("create account"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Forget email",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Forget password",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
