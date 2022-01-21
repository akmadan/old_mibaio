import 'package:flutter/material.dart';
import 'package:mibaio_smart_app/choose_room.dart';
import 'package:mibaio_smart_app/if_then_condition.dart';

class TimeAutomation extends StatefulWidget {
  const TimeAutomation({Key? key}) : super(key: key);

  @override
  _TimeAutomationState createState() => _TimeAutomationState();
}


class _TimeAutomationState extends State<TimeAutomation> {
  TimeOfDay selectedTime = TimeOfDay.now();
  String time='';
  List<String> listOfRepeat = [];
  bool noRepeat=false;
  bool repAll = false, repSun=false, repMon=false, repTue=false, repWed=false, repThurs=false, repFri=false, repSat=false;
  @override
  Widget build(BuildContext context) {
    listOfRepeat.clear();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 7,
              margin: const EdgeInsets.only(
                  left: 0, top: 25, right: 0, bottom: 0),
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
                  Flexible(
                    child: Text(
                      'Select Time',
                      style: TextStyle(
                        fontSize: 27,
                        fontFamily: 'AvenirLTStdR',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if(time=='Time'){
                        final snackBar = SnackBar(content: Text('Please select the Time'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }else if(noRepeat&&(repAll||repMon||repTue||repWed||repThurs||repFri||repSat||repSun)){
                        final snackBar = SnackBar(content: Text('Invalid Selection'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }else if(repAll&&(noRepeat||repMon||repTue||repWed||repThurs||repFri||repSat||repSun)){
                        final snackBar = SnackBar(content: Text('Invalid Selection'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }else {

                        listOfRepeat.clear();
                        if(repAll){
                          listOfRepeat.add('Sunday');
                          listOfRepeat.add('Monday');
                          listOfRepeat.add('Tuesday');
                          listOfRepeat.add('Wednesday');
                          listOfRepeat.add('Thursday');
                          listOfRepeat.add('Friday');
                          listOfRepeat.add('Saturday');
                        }
                        if(repSun){
                          listOfRepeat.add('Sunday');
                        }
                        if(repMon) {
                          listOfRepeat.add('Monday');
                        }
                        if(repTue){
                          listOfRepeat.add('Tuesday');
                        }
                        if(repWed){
                          listOfRepeat.add('Wednesday');
                        }
                        if(repThurs){
                          listOfRepeat.add('Thursday');
                        }
                        if(repFri){
                          listOfRepeat.add('Friday');
                        }
                        if(repSat){
                          listOfRepeat.add('Saturday');
                        }
                        if(noRepeat){
                          listOfRepeat.add('No Repeat');
                        }
                        getTimeAndDays(time, listOfRepeat);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseRoom()));
                      }
                    },
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _selectTime(context);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(20.0),
                            ),
                            elevation: 0,
                            child: Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 5, 15, 5),
                                    child: Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width /
                                          2,
                                      child: Text(
                                       'Time: $time'
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async{
                                      _selectTime(context);
                                    },
                                    icon: Icon(Icons.alarm),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(20.0),
                            ),
                            elevation: 0,
                            child: Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 5, 15, 5),
                                    child: Container(
                                      width: MediaQuery.of(context)
                                          .size
                                          .width /
                                          2,
                                      child: Text(
                                          'Repeat:'
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async{
                                    },
                                    icon: Icon(Icons.refresh),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 20, 20),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: Text("No Repeat"),
                          value: noRepeat,
                          
                          onChanged: (newValue) {
                            setState(() {
                              noRepeat = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: Text("Every Day"),
                          value: repAll,
                          onChanged: (newValue) {
                            setState(() {
                              repAll = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: Text("Monday"),
                          value: repMon,
                          onChanged: (newValue) {
                            setState(() {
                              repMon = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: Text("Tuesday"),
                          value: repTue,
                          onChanged: (newValue) {
                            setState(() {
                              repTue = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: Text("Wednesday"),
                          value: repWed,
                          onChanged: (newValue) {
                            setState(() {
                              repWed = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: Text("Thursday"),
                          value: repThurs,
                          onChanged: (newValue) {
                            setState(() {
                              repThurs = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: Text("Friday"),
                          value: repFri,
                          onChanged: (newValue) {
                            setState(() {
                              repFri = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: Text("Saturday"),
                          value: repSat,
                          onChanged: (newValue) {
                            setState(() {
                              repSat = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          title: Text("Sunday"),
                          value: repSun,
                          onChanged: (newValue) {
                            setState(() {
                              repSun = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
        confirmText: "CONFIRM",
        cancelText: "NOT NOW",
        helpText: "SELECT TIME"

    );
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
      setState(() {
        selectedTime = timeOfDay;
        time = "${selectedTime.hour}:${selectedTime.minute}";
      });
    }
  }
}
