import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'connection.dart';
import 'led.dart';
import 'package:flutter/material.dart';

class Home2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Connection'),
          ),
          body: SelectBondedDevicePage(
            onCahtPage: (device1) {
              BluetoothDevice device = device1;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                    ChatPage(server: device),
                ),
              );
            },
          ),
        ));
  }
}

