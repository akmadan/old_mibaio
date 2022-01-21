import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  List<String> emailAddress = ['swarangi.patil@gmail.com'];
  String emailSubject = '';
  String emailBody='';
  _launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<void> send() async {
    final Email email = Email(
      body: emailBody,
      subject: emailSubject,
      recipients: emailAddress,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 7,
              margin: const EdgeInsets.only(
                  left: 0, top: 25, right: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Flexible(
                    child: Text(
                      'Feedback/Complaint',
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'AvenirLTStdR',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (emailBody.isEmpty) {
                        final snackBar = SnackBar(content: Text('Please Enter Feedback/suggestions'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }else if (emailSubject.isEmpty) {
                        final snackBar = SnackBar(content: Text('Please enter a subject'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }else {
                        await send();
                      }
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'AvenirLTStdR',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 8, 0, 8),
                  child: Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'AvenirLTStdR',
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                      emailSubject = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Subject here',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.fromLTRB(15,10,15,10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'AvenirLTStdR',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 8, 0, 8),
                  child: Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'AvenirLTStdR',
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (value){
                      emailBody=value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your feedback or suggestions here',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.fromLTRB(15,20,15,20),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'AvenirLTStdR',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 8, 0, 8),
                  child: Text(
                    'Get in touch now!',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'AvenirLTStdR',
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: (){
                              _launchPhoneURL('9673660515');
                            },
                            child: Text(
                              '+91 967 366 0515',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'AvenirLTStdR',
                                  color: Color(0xFF4A80F0)
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: Text(
                            'hello@mibaio.xyz',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'AvenirLTStdR',
                              color: Color(0xFF4A80F0)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
