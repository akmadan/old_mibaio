import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:http/http.dart' as http;
import 'package:mibaio_smart_app/addDevice.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:convert';
import 'package:visibility_detector/visibility_detector.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

import 'edit_rooms.dart';

bool hasDevice=false;

late String home;
String? roomName;
class tabs extends StatefulWidget {
  final String uid;
  late final String homeName;
  tabs({required this.uid,required this.homeName});
  @override
  _tabsState createState() => _tabsState();
}

class _tabsState extends State<tabs> with TickerProviderStateMixin {
  bool isLoading=true;
  List list_name=[];
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 10));
    // if failed,use refreshFailed()
    await getRooms();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 10));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    await getRooms();
    if(mounted)
      setState(() async {

      });
    _refreshController.loadComplete();
  }
  Future getRooms()async{
    list_name.clear();
    String theURL = "https://mibaio.in/dbfiles/display-rooms.php?user=${widget.uid}&env=${widget.homeName}";
    final response = await http.get(Uri.parse(theURL));
    var temp = json.decode(response.body);
    for(int i=0;i<temp.length;i++){
      list_name.add(temp[i]["${i+1}"]);
    }
    print(list_name);
    tabController = TabController(
      initialIndex: selectedIndex,
      length: list_name.length,
      vsync: this,
    );

    tabController.addListener(() {
      setState(() {
        print(tabController.index);
        _scrollController.move(tabController.index);
      });
    });
    setState(() {
      isLoading = false;

    });
    String deviceURL = "https://mibaio.in/dbfiles/display-device-room.php?user=${widget.uid}&env=${widget.homeName}&room=${list_name[0]}";
    final resp = await http.get(Uri.parse(deviceURL));

    var check = json.decode(resp.body);
    if(check[0]==null){
      hasDevice=false;
       roomName=list_name[0];
    }
    else{
      hasDevice=true;
    }


  }


  SwiperController _scrollController = new SwiperController();

  late TabController tabController;

  int currentindex2 = 0; // for swiper index initial

  int selectedIndex = 0; // for tab

  @override
  void initState() {
    super.initState();
    getRooms();

  }


  @override
  Widget build(BuildContext context) {

    home = widget.homeName;
    return isLoading ? Container( height: double.infinity,
      child: SpinKitCircle(
        color: Color(0xFF4A80F0),
        size: 50.0,
      ),) : SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
        child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top:25, right: 20, bottom:0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rooms',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'AvenirLTStdR',
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.black, size: 30,),
                    onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => EditRooms()));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            DefaultTabController(
              length: list_name.length,
              child: Container(
                constraints: BoxConstraints(maxHeight: 35.0),
                child: Material(
                  child: TabBar(
                    onTap: (index)async{
                      _scrollController.move(index);
                      },
                    controller: tabController,
                    isScrollable: true,
                    indicatorColor: Color.fromRGBO(0, 202, 157, 1),
                    labelColor: Color.fromRGBO(0, 202, 157, 1),
                    labelStyle: TextStyle(fontSize: 12),
                    unselectedLabelColor: Colors.black,
                    tabs: List<Widget>.generate(list_name.length,
                        (int index) {
                      return new Tab(text: list_name[index]);
                    }),
                  ),
                ),
              ),
            ),

            Expanded(
              child: new Swiper(
                onIndexChanged: (index) {
                  setState(() async {
                    selectedIndex = index;
                    tabController.animateTo(index);
                    currentindex2 = index;
                   String deviceURL = "https://mibaio.in/dbfiles/display-device-room.php?user=${widget.uid}&env=${widget.homeName}&room=${list_name[index]}";
                    final resp = await http.get(Uri.parse(deviceURL));

                    var check = json.decode(resp.body);
                    print(check);
                    if(check[0]==null){
                      hasDevice=false;
                    }
                    else{
                      hasDevice=true;
                    }

                  });
                },
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                    tabController.animateTo(index);
                    currentindex2 = index;

                  });
                },
                duration: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return VisibilityDetector(
                    key: Key(index.toString()),
                    child: Center(
                      child: hasDevice ? Column(
                        children: [
                          Text(
                            list_name[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30),
                          ),
                        ],
                      ) : Column(
                        children: [
                          Image.asset(
                            'assets/adddevice.png',
                            height: 350,
                          ),
                          Text('Looks like you haven''t added any device yet', style: TextStyle(
                              fontFamily: 'AvenirLTStdR',
                            fontSize: 15,
                          ),  ),
                          MaterialButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDevice()));
                          },child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(' + Add a Device', style: TextStyle(fontSize: 20,
                              fontFamily: 'AvenirLTStdR', color: Color.fromRGBO(0, 202, 157, 1)),),
                          ),)

                        ],
                      ),
                    ),
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (info.visibleFraction == 1)
                        setState(() {
                          selectedIndex = index;
                          tabController.animateTo(index);
                          currentindex2 = index;
                          print(index);
                        });
                    },
                  );
                },
                itemCount: list_name.length,
              ),
            ),
          ],
        ),
    ),
      );
  }


}
