import 'package:flutter/material.dart';
import 'package:mibaio_smart_app/bluetoothTesting.dart';

class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 20, top: 25, right: 20, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
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
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        'MiBAiO 4s',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'AvenirLTStdR',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.grey[200],
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20, top: 25, right: 20, bottom: 0),
                      height: MediaQuery.of(context).size.height / 1.456,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              'When connecting to MIBAiO failed, use a PIN press the reset hole on device. When you see the status of light turning yellow, 4s has been successfully reset.',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'AvenirLTStdR',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BluetoothCheck()));
                    },
                    child: Text('Next', style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'AvenirLTStdR',
                    ),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
