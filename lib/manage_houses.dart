import 'package:flutter/material.dart';

class ManageHouses extends StatefulWidget {
  const ManageHouses({Key? key}) : super(key: key);

  @override
  _ManageHousesState createState() => _ManageHousesState();
}

class _ManageHousesState extends State<ManageHouses> {
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
                  Text(
                    'Manage Houses',
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
          ],
        ),
      ),
    );
  }
}
