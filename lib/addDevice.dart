import 'package:flutter/material.dart';
import 'package:mibaio_smart_app/confirmPage.dart';

class AddDevice extends StatefulWidget {


  @override
  _AddDeviceState createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top:25, right: 20, bottom:0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_left, color: Colors.black, size: 30,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 40,),
                Text(
                  'Add Device',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'AvenirLTStdR',
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [

                Expanded(
                  child: GestureDetector(
                    onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPage()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.grey[300],
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, top:25, right: 20, bottom:0),
                        height: MediaQuery.of(context).size.height/6,
                        child: Text('MiBAiO 4s', style: TextStyle(fontSize: 20,
                          fontFamily: 'AvenirLTStdR',),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
