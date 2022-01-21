import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mibaio_smart_app/if_then_condition.dart';

class AutomationTab extends StatefulWidget {
  const AutomationTab({Key? key}) : super(key: key);

  @override
  _AutomationTabState createState() => _AutomationTabState();
}

class _AutomationTabState extends State<AutomationTab> {
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
                      'Automations',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'AvenirLTStdR',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IconButton(
                      icon: Icon(Icons.add, color: Colors.black, size: 30,),
                      onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>IfThenConditionPage()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: Text(
                        'To add Automation tap ''+'''
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
