import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  'assets/login.svg',
                  height: 200,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Text(
                "Welcome to Mibaio Smart App",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'AvenirLTStdR'),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(width: 1, color: Colors.black),
                          fixedSize: Size(260, 60),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          )), // double.infinity is the width and 30 is the height

                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'AvenirLTStdR',
                        ),
                      )),
                ),
              ),
            ),
            // SizedBox(
            //height: 12,
            //  ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // side: BorderSide(width:1, color:Colors.black),
                    fixedSize: Size(
                      260,
                      60,
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0)),
                  ),
                  // double.infinity is the width and 30 is the height

                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'AvenirLTStdR', /*fontFamily: 'Avenir'*/
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
