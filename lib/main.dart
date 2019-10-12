import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cool_weather/view/provinces_page.dart';
import 'package:cool_weather/view/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String _cityID;

  @override
  void initState() {
    // 从文件读取ID
    _readCounter();
    super.initState();
  }

  void _readCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String cityID = preferences.getString("cityID");
    setState(() {
      _cityID = cityID;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cool Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _cityID == null
          ? ProvincesPageWidget()
          : MainPage(
              cityID: _cityID,
            ),
    );
  }
}
