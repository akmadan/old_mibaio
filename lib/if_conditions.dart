import 'package:flutter/material.dart';
import 'package:mibaio_smart_app/time_automation.dart';

class IfConditions extends StatefulWidget {
  const IfConditions({Key? key}) : super(key: key);

  @override
  _IfConditionsState createState() => _IfConditionsState();
}

class _IfConditionsState extends State<IfConditions> {
  @override
  Widget build(BuildContext context) {
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TimeAutomation()));
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Time', style: TextStyle(fontSize: 20,
                                fontFamily: 'AvenirLTStdR',),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Device Status', style: TextStyle(fontSize: 20,
                              fontFamily: 'AvenirLTStdR',),),
                            
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
