import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thurs/models/user_model.dart';
import 'package:thurs/screens/login_screen.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  //object from ImagePicker
  final ImagePicker picker = ImagePicker();
  SharedPreferences? prefs;
  File? image;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    prefs = await SharedPreferences.getInstance();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Register",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              // Center(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              image == null
                  ? InkWell(
                      onTap: () async {
                        final XFile? file =
                            await picker.pickImage(source: ImageSource.gallery);
                        image = File(file!.path);
                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(75)),
                        child: Icon(
                          Icons.camera,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 75,
                      backgroundImage: FileImage(image!),
                    ),

              //----------------------------------------
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 300,
                height: 30,
                // margin: EdgeInsets.all(10),
                child: Container(
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        prefix: Icon(Icons.person),
                        labelText: "Name: ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 30,
                margin: EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.email),
                      labelText: "Email: ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                width: 300,
                height: 30,
                margin: EdgeInsets.only(top: 15),
                child: Container(
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.password),
                        labelText: "Password: ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 30,
                margin: EdgeInsets.only(top: 15),
                child: Container(
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        prefix: Icon(Icons.phone),
                        labelText: "phone number: ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 30,
                margin: EdgeInsets.only(top: 15),
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefix: Icon(Icons.person_3),
                        labelText: "Gender: ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 20,
                margin: EdgeInsets.all(20),
                child: MaterialButton(
                  onPressed: () {
                    //this obect
                    UserModel user = UserModel(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                        image: image!.path);

                    if (prefs!.containsKey(emailController.text)) {
                      //same packege
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("email is exist")));
                    } else {
                      //now converte the object to map

                      prefs!
                          .setString(
                              emailController.text, jsonEncode(user.toMap()))
                          .then((value) {
                        Navigator.pop(context);
                      });
                    }

                    // prefs!.setString(
                    //     emailController.text, jsonEncode(user.toMap()));
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => LoginScreen(),
                    //     ));
                  },
                  child: Text(
                    "Create An Account",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color.fromARGB(255, 6, 112, 199),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
