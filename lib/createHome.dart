import 'package:flutter/material.dart';
import 'package:mibaio_smart_app/tabs.dart';
import 'package:mibaio_smart_app/homeScreen.dart';
import 'package:http/http.dart' as http;

class CreateHome extends StatefulWidget {
  final String uid;
  CreateHome({required this.uid});

  @override
  _CreateHomeState createState() => _CreateHomeState();
}

List<String> roomList = [];
List<MyRooms> allRooms = [];
String? userName;
void getUserName(String userN) {
  userName = userN;
}

class _CreateHomeState extends State<CreateHome> {
  TextEditingController _roomName = TextEditingController();
  TextEditingController _homeName = TextEditingController();
  String? homeName;
  String roomName = '';
  late int randomSetStateVariable;

  void triggerUpdate(){
    setState(() {
      randomSetStateVariable = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(userName);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Create Home',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              )
            ],
          )),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
          color: Color(0xFF4A80F0),
        ),
        //centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () async {
                print(roomList);
                if (_homeName.text.isEmpty) {
                  final snackBar = SnackBar(content: Text('Please add home name'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                } else {
                  String rooms = "";
                  for (int i = 0; i < roomList.length; i++) {
                    rooms += roomList[i] + ',';
                  }
                  String finalRooms = "";
                  for (int i = 0; i < rooms.length - 1; i++) {
                    finalRooms += rooms[i];
                  }

                  String url =
                      'https://mibaio.in/dbfiles/create_env.php?user=${widget.uid}&env=${_homeName.text}&room=$finalRooms';
                  final response = await http.get(Uri.parse(url));
                  print(response.body);
                  if (response.body.toString() == '1') {
                    roomList.clear();
                    allRooms.clear();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(uid: widget.uid,home: _homeName.text)));
                  } else {
                    final snackBar =
                        SnackBar(content: Text('Some error occured'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }
                }
              },
              child: Text('Done'),
            ),
          ),
        ],
        //backgroundColor: Colors.purple,
        flexibleSpace: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        elevation: 2,
        titleSpacing: 20,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextFormField(
                      autofocus: false,
                      controller: _homeName,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8.0),
                        labelText: 'Enter name of your home',
                        hintText: 'Enter name of your home',
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your home name';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        homeName = value!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextFormField(
                      autofocus: false,
                      controller: _roomName,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8.0),
                        labelText: 'Enter name of a room',
                        hintText: 'Enter name of a room',
                        suffixIconConstraints: BoxConstraints(
                          minWidth: 2,
                          minHeight: 2,
                        ),
                        suffixIcon: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.check, size: 20),
                            ),
                            onTap: () {
                              setState(() {
                                var item = MyRooms(room: roomName,myFunction: triggerUpdate,);
                                allRooms.add(item);
                                roomList.add(roomName);
                                _roomName.clear();
                                print(allRooms);
                                print(roomList);
                              });
                            }),
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter name of the room';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        roomName = value!;
                      },
                      onChanged: (value) {
                        roomName = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: allRooms,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class MyRooms extends StatefulWidget {
  final String room;
  final Function myFunction;
  MyRooms({required this.room,required this.myFunction});

  @override
  _MyRoomsState createState() => _MyRoomsState();
}

class _MyRoomsState extends State<MyRooms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.room,
                style: TextStyle(color: Colors.black, fontSize: 16.0)),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                int index = 0;
                for (int i = 0; i < roomList.length; i++) {
                  if (roomList[i] == widget.room) {
                    index = i;
                    print(roomList[i]);
                    print(index);
                    break;
                  }
                }
                roomList.removeAt(index);
                allRooms.removeAt(index);
                widget.myFunction();
              });
            },
            child: Icon(
              Icons.delete,
              color: Colors.grey,
              size: 25.0,
            ),
          ),
        ],
      ),
      margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.white),
    );
  }
}
