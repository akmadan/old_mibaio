import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mibaio_smart_app/if_conditions.dart';
import 'package:mibaio_smart_app/time_automation.dart';

class IfThenConditionPage extends StatefulWidget {
  const IfThenConditionPage({Key? key}) : super(key: key);

  @override
  _IfThenConditionPageState createState() => _IfThenConditionPageState();
}
String time='';
List<String> listOfRepeat = [];
class _IfThenConditionPageState extends State<IfThenConditionPage> {
  @override
  Widget build(BuildContext context) {
    time='';
    listOfRepeat.clear();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              margin: const EdgeInsets.only(left: 0, top:25, right: 0, bottom:0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Add Automations',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
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
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                            'If',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'AvenirLTStdR',
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>IfConditions()));
                    },
                    child: Container(
                      height: 80,
                      child:  Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Colors.grey[300],
                        child: Container(
                          margin: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),
                          height: MediaQuery.of(context).size.height/6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text('', style: TextStyle(fontSize: 20,
                                  fontFamily: 'AvenirLTStdR',),),
                              ),
                              Icon(Icons.add),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          'Then',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'AvenirLTStdR',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    child:  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.grey[300],
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, top:10, right: 20, bottom:10),
                        height: MediaQuery.of(context).size.height/6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('', style: TextStyle(fontSize: 20,
                              fontFamily: 'AvenirLTStdR',),),
                            Icon(Icons.add),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
