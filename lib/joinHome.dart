import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:mibaio_smart_app/homeScreen.dart';
import 'package:http/http.dart' as http;

class JoinHome extends StatefulWidget {
  final String uid;
  JoinHome({required this.uid});

  @override
  _JoinHomeState createState() => _JoinHomeState();
}

class _JoinHomeState extends State<JoinHome> {
  List allHomes = [];
  List<MyRooms> homeList = [];
  bool showLoader = true;

  void getData() async {
    String theURL =
        "https://mibaio.in/dbfiles/display-homes.php?user=${widget.uid}";
    final response = await http.get(Uri.parse(theURL));
    var temp = json.decode(response.body);
    List allHomes2 = [];
    List<MyRooms> homeList2 = [];
    for (int i = 0; i < temp.length; i++) {
      allHomes2.add(temp[i]["${i + 1}"]);
      String home = allHomes2[i];
      homeList2.add(MyRooms(
        uid: widget.uid,
        home: home,
      ));
    }
    setState(() {
      allHomes = allHomes2;
      homeList = homeList2;
      showLoader = false;
    });
    print(allHomes);
    print(homeList);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (!showLoader) {
      return Scaffold(
          body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 7,
              margin:
                  const EdgeInsets.only(left: 0, top: 25, right: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  Text(
                    'Select House',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'AvenirLTStdR',
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: ListView(
              children: homeList,
            ),
          ),
        ],
      ));
    } else if (homeList.isEmpty) {
      return SafeArea(
        child: Scaffold(
          body: Text('You have not created a home yet'),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          body: SpinKitCircle(
            color: Color(0xFF4A80F0),
            size: 50.0,
          ),
        ),
      );
    }
  }
}

class MyRooms extends StatefulWidget {
  final String home;
  final String uid;

  MyRooms({required this.home, required this.uid});

  @override
  _MyRoomsState createState() => _MyRoomsState();
}

class _MyRoomsState extends State<MyRooms> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(widget.home,
                  style: TextStyle(color: Colors.black, fontSize: 16.0)),
            ),
          ],
        ),
        margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), color: Colors.white),
      ),
      onTap: () {
        setState(() {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen(uid: widget.uid, home: widget.home)));
        });
      },
    );
  }
}
