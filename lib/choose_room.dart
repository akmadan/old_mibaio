import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'joinHome.dart';
import 'dashboard.dart';
import 'loginScreen.dart';

class ChooseRoom extends StatefulWidget {
  const ChooseRoom({Key? key}) : super(key: key);

  @override
  _ChooseRoomState createState() => _ChooseRoomState();
}
String time='';
List<String> listOfRepeat = [];
void getTimeAndDays(String timeo, List<String> listOfRepeato){
  time=timeo;
  listOfRepeat=listOfRepeato;
}
class _ChooseRoomState extends State<ChooseRoom> {
  List list_name = [];
  List device_names = [];
  bool isLoading = true;
  bool hasRooms = false;
  // Future getDevices() async {
  //   for(int i=0; i<list_name.length; i++)
  //     {
  //       String url = 'https://mibaio.in/dbfiles/display-device-room.php?user=${userID}&env=${home}&room=${list_name[i]}';
  //       final response = await http.get(Uri.parse(url));
  //       var something = json.decode(response.body);
  //       print(something);
  //     }
  //
  // }
  Future getRooms() async {
    String theURL =
        "https://mibaio.in/dbfiles/display-rooms.php?user=$userID&env=";
    final response = await http.get(Uri.parse(theURL));
    var temp = json.decode(response.body);
    list_name.clear();
    for (int i = 0; i < temp.length; i++) {
      setState(() async {
        list_name.add(temp[i]["${i + 1}"]);

      });
    }
    print(list_name);
    setState(() {
      isLoading = false;
    });
    if (list_name[0] == null) {
      hasRooms = false;
    } else {
      hasRooms = true;
      //getDevices();
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRooms();
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
                      'Choose Appliances',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'AvenirLTStdR',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
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
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: list_name.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20.0),
                              ),
                              elevation: 0,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      15, 5, 15, 5),
                                  child: Container(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width /
                                        2,
                                    child: Column(
                                      children: [
                                        Text(
                                          list_name[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'AvenirLTStdR',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
