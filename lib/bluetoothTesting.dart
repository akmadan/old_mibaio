import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'allDevices.dart';

class BluetoothCheck extends StatefulWidget {
  const BluetoothCheck({Key? key}) : super(key: key);

  @override
  _BluetoothCheckState createState() => _BluetoothCheckState();
}

class _BluetoothCheckState extends State<BluetoothCheck> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothState>(
        stream: FlutterBlue.instance.state,
        initialData: BluetoothState.unknown,
        builder: (c, snapshot) {
          final state = snapshot.data;
          if (state == BluetoothState.on) {
            return Home2();
          }
          return Scaffold(
            body: Container(
              height: double.infinity,
              child: Center(
                child: Icon(
                  Icons.bluetooth_disabled,
                  size: 200.0,
                  color: Colors.blue,
                ),
              ),
            ),
          );
        });
  }
}
