import 'package:flutter/material.dart';
import 'package:ota_update/ota_update.dart';
import 'package:package_info/package_info.dart';

class UpdateDemo extends StatefulWidget {
  UpdateDemo({Key key}) : super(key: key);

  _UpdateDemoState createState() => _UpdateDemoState();
}

class _UpdateDemoState extends State<UpdateDemo> {

  OtaEvent currentEvent;

  Future<void> tryOtaUpdate() async {
    try {
      OtaUpdate().execute('http://www.360inhands.com/app.apk').listen((OtaEvent event){
        print(event.status.toString() + ": "  + event.value);
      });
    } catch (e) {
      print('Failed to make OTA update. Details: $e');
    }
  }

  _update() async {
    print('开始升级');
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    print(packageInfo.version);
    tryOtaUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('应用内升级')
      ),
      body: Center(
        child: Text('点击下方按钮检测更新'),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () {
              _update();
            },
            tooltip: '点击检测更新',
            child: Text('更新'),
          );
        },
      ),
    );
  }
}