import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mibaio_smart_app/loginScreen.dart';
import 'package:mibaio_smart_app/tabs.dart';

import 'createHome.dart';

class EditRooms extends StatefulWidget {
  const EditRooms({Key? key}) : super(key: key);

  @override
  _EditRoomsState createState() => _EditRoomsState();
}

class _EditRoomsState extends State<EditRooms> {
  bool isEditable = false;
  String newRoomName = '';
  bool isLoading = true;
  bool _value = false;
  int val = -1;
  List list_name = [];
  bool hasRooms = false;
  Future getRooms() async {
    String theURL =
        "https://mibaio.in/dbfiles/display-rooms.php?user=${userID}&env=${home}";
    final response = await http.get(Uri.parse(theURL));
    var temp = json.decode(response.body);
    list_name.clear();
    for (int i = 0; i < temp.length; i++) {
      setState(() {
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
    }
  }

  @override
  void initState() {
    super.initState();
    getRooms();
    list_name.clear();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
      height: double.infinity,
      child: SpinKitCircle(
        color: Color(0xFF4A80F0),
        size: 50.0,
      ),
    )
        : Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  Text(
                    'Edit Rooms',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'AvenirLTStdR',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 8, 0, 8),
                  child: Text(
                    'Your house name',
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
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      initialValue: home,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'AvenirLTStdR',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 8, 0, 8),
                  child: Text(
                    'Rooms',
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: list_name.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Card(
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
                                          child: TextFormField(
                                            initialValue: list_name[index],
                                            onChanged: (value) {
                                              newRoomName = value;
                                            },
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'AvenirLTStdR',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async{
                                    String url ='https://mibaio.in/dbfiles/rename_room.php?user=$userID&previous=${list_name[index]}&env=$home&new=$newRoomName';
                                    final response = await http.get(Uri.parse(url));
                                    var temp=json.decode(response.body);
                                    print(temp);
                                    print(response);
                                    setState(() {
                                      list_name[index]=newRoomName;
                                    });

                                  },
                                  icon: Icon(Icons.check),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            );
                          }),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Add Room'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),
          ],
        ),
      ),
    );
  }
}
