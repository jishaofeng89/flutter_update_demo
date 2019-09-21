import 'package:flutter/material.dart';

class UpdateDemo extends StatefulWidget {
  UpdateDemo({Key key}) : super(key: key);

  _UpdateDemoState createState() => _UpdateDemoState();
}

class _UpdateDemoState extends State<UpdateDemo> {
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
              print('开始更新了');
            },
            tooltip: '点击检测更新',
            child: Text('更新'),
          );
        },
      ),
    );
  }
}