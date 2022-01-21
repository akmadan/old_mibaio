import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mibaio_smart_app/homeScreen.dart';

import 'createHome.dart';
import 'dashboard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, top:25, right: 20, bottom:0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hi, $userName',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'AvenirLTStdR',
                           ),
                        ),
                        IconButton(
                          icon: Icon(Icons.bluetooth, color: Color(0xFF4A80F0), size: 30,),
                          onPressed: (){

                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, top:20, right: 15, bottom:0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset('assets/home.png',),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '0',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xFF4A80F0),
                                        fontSize: 25,
                                        fontFamily: 'AvenirLTStdR',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Switches On',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'AvenirLTStdR',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 20,),
                                  Text(
                                    '$celsius°',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xFF4A80F0),
                                        fontSize: 25,
                                        fontFamily: 'AvenirLTStdR',
                                        fontWeight: FontWeight.w600),
                                  ),

                                  Text(
                                    'Currently',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'AvenirLTStdR',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Favorites',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'AvenirLTStdR',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Routines'),
                  ),
                ],
              ),
              Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Appliances'),
                ),
              ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
