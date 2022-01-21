import 'package:flutter/material.dart';

class NewAppliances extends StatefulWidget {
  const NewAppliances({Key? key}) : super(key: key);

  @override
  _NewAppliancesState createState() => _NewAppliancesState();
}

class _NewAppliancesState extends State<NewAppliances> {
  @override
  Widget build(BuildContext context) {
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
                  Text(
                    'New Appliances',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'AvenirLTStdR',
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
                itemBuilder: (context, index){
                  return Row(

                  );
                }),
          )
        ],
      ),
    );
  }
}
