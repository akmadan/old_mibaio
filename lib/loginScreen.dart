import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
bool _validateUsername = false;
bool _validatePassword = false;
String? userID;
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Login Here",
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
              child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      labelText: 'E-mail ID or Username',
                      hintText: 'Enter your E-mail ID or Username',
                      errorText: _validateUsername ? 'Username or Email cannot be empty':null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
              controller: _email,),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                  obscureText: true,
                  autofocus: false,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter a strong password',
                      errorText: _validatePassword ? 'Password cannot be empty':null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
              controller: _password,),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () async {
                   setState(() {
                      _email.text.isEmpty ? _validateUsername = true : _validateUsername=false;
                      _password.text.isEmpty ? _validatePassword = true : _validatePassword=false;
                    });

                    if(_validateUsername==false && _validatePassword==false){
                      String username = _email.text;
                      String password = _password.text;
                      String theURL = "https://mibaio.in/dbfiles/run_login.php?username=$username&pass=$password";
                      final response = await http.get(Uri.parse(theURL));
                      var temp=json.decode(response.body);

                      if(response.body=='0' || response.statusCode!=200){

                        Fluttertoast.showToast(
                            msg: "Something went wrong. Please try again!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );

                      }
                      else{
                        final SharedPreferences sharedref = await SharedPreferences.getInstance();
                        sharedref.setString('email', _email.text);
                        userID = temp["User_ID"];
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard(username: temp["Name"],uid: temp["User_ID"],)));
                        _email.clear();
                        _password.clear();
                      }
                    }

                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        260,
                        60,
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0))),
                  child: Text("letsGO!",
                      style: TextStyle(
                          fontFamily: 'AvenirLTStdR', fontSize: 22))),
            )
          ],
        ),
      );
  }
}
