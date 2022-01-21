import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:http/http.dart' as http;
import 'package:mibaio_smart_app/Settings.dart';
import 'package:mibaio_smart_app/tabs.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

import 'automationTab.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {
  final String uid;
  final String home;
  
  HomeScreen({required this.uid,required this.home});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  SwiperController _scrollController = new SwiperController();

  late TabController tabController;


  int currentindex2=0; // for swiper index initial

  int selectedIndex = 0; // for tab

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Home(),
      tabs(uid: widget.uid,homeName: widget.home),
      AutomationTab(),
      Settings()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined,),
                title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.single_bed_outlined,),
                title: Text('Rooms'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.av_timer_outlined),
              title: Text('Automations'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5,

      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

}

