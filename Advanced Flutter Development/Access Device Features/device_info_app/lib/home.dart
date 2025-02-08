import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String model = "Unknown";
  String os = "Unknown";

  Future<void> getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        model = androidInfo.model;
        os = "Android ${androidInfo.version.release}";
      });
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        model = iosInfo.utsname.machine;
        os = "iOS ${iosInfo.systemVersion}";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Device Info"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Device Model : $model ",
              style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "OS Version : $os",
              style: TextStyle(fontSize: 20 , fontWeight:FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
