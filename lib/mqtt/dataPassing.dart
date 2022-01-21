import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:mibaio_smart_app/homeScreen.dart';
import 'package:mibaio_smart_app/tabs.dart';

String? env;
class DataPassing extends StatefulWidget {
  final BluetoothDevice server;
  final String userid;

  final String deviceId;

  const DataPassing({required this.server,required this.userid,required this.deviceId});

  @override
  _DataPassing createState() => new _DataPassing();
}



class _DataPassing extends State<DataPassing> {
  static final clientID = 0;
  BluetoothConnection? connection;


  String _messageBuffer = '';


  bool isConnecting = true;
  bool get isConnected => connection != null && connection!.isConnected;

  bool isDisconnecting = false;

  void addDevice()async{
    env=home;
    String room=roomName!;
    String theURL = "https://mibaio.in/dbfiles/run_add_device.php?user=${widget.userid}&room=$room&env=$env&d_id=${widget.deviceId}";
    final response = await http.get(Uri.parse(theURL));
    var temp = json.decode(response.body);
    print(temp);
  }

  @override
  void initState() {
    super.initState();

    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      print('Connected to the device');

      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;

      });

      // connection!.input.listen(_onDataReceived).onDone(() {
      //   // Example: Detect which side closed the connection
      //   // There should be `isDisconnecting` flag to show are we are (locally)
      //   // in middle of disconnecting process, should be set before calling
      //   // `dispose`, `finish` or `close`, which all causes to disconnect.
      //   // If we except the disconnection, `onDone` should be fired as result.
      //   // If we didn't except this (no flag set), it means closing by remote.
      //   if (isDisconnecting) {
      //     print('Disconnecting locally!');
      //   } else {
      //     print('Disconnected remotely!');
      //   }
      //   if (this.mounted) {
      //     setState(() {});
      //   }
      // });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });

    _sendMessage('M'+widget.userid+'^'+widget.deviceId+'^');
    addDevice();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomeScreen(uid: widget.userid, home: env!)));
  }

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection!.dispose();
      connection = null as BluetoothConnection;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }



  void _sendMessage(String text) async {
    text = text.trim();
    var encodedText = utf8.encode(text);
    Uint8List encodedBytes = Uint8List.fromList(encodedText);


    if (text.length > 0) {
      try {
        connection!.output.add(encodedBytes);
        await connection!.output.allSent;


        Future.delayed(Duration(milliseconds: 333)).then((_) {

        });
      } catch (e) {
        // Ignore error, but notify state
        setState(() {});
      }
    }
  }
}
