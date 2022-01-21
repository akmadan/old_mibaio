import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;
import 'package:mibaio_smart_app/dashboard.dart';
import 'package:mibaio_smart_app/loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

TextEditingController _usernameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _repasswordController = TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? username;
  String? password;
  String? cpassword;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          bottomOpacity: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
            color: Color(0xFF4A80F0),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Create Your Account Here",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        controller: _usernameController,
                        autofocus: false,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          username = value!;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        controller: _emailController,
                        autofocus: false,
                        decoration: InputDecoration(
                            labelText: 'E-mail ID',
                            hintText: 'Enter your E-mail ID',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your email';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value!)) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          email = value!;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        autofocus: false,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter a strong password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Password cannot be empty';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          password = value!;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: TextFormField(
                        obscureText: true,
                        controller: _repasswordController,
                        autofocus: false,
                        decoration: InputDecoration(
                            labelText: ' Comfirm Password',
                            hintText: 'Re-enter password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please re-enter password';
                          }

                          if (_passwordController.text !=
                              _repasswordController.text) {
                            return "Password does not match";
                          }

                          return null;
                        },
                        onSaved: (String? value) {
                          cpassword = value!;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            String username = _usernameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String theURL =
                                "https://mibaio.in/dbfiles/run_register.php?name=$username&pass=$password&email=$email";
                            final response = await http.get(Uri.parse(theURL));
                            if (response.body != '1' ||
                                response.statusCode != 200) {
                              if (response.body == '-1') {
                                Fluttertoast.showToast(
                                    msg:
                                        "User with this email-id already exists",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Something went wrong. Please try again!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LoginScreen(),
                                ),
                              );
                              _usernameController.clear();
                              _emailController.clear();
                              _passwordController.clear();
                              _repasswordController.clear();
                            }

                            return;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            260,
                            60,
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                        ),
                        child: Text(
                          "letsGO!",
                          style: TextStyle(
                              fontFamily: 'AvenirLTStdR', fontSize: 22),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
