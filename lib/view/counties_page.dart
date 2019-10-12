import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'main_page.dart';
import 'package:cool_weather/bean/county.dart';
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class CountiesPageWidget extends StatefulWidget {
  final int cityID;
  final int countyID;

  CountiesPageWidget({Key key, this.cityID, this.countyID}) : super(key: key);

  @override
  CountiesPageWidgetState createState() => CountiesPageWidgetState();
}

class CountiesPageWidgetState extends State<CountiesPageWidget> {
  int _cityID;
  int _countyID;
  List<County> _county;

  @override
  void initState() {
    _cityID = widget.cityID;
    _countyID = widget.countyID;
    super.initState();
  }

  void _saveCityID(String cityID) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("cityID", cityID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "区县",
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      body: FutureBuilder(
        future: Dio().get("http://guolin.tech/api/china/$_cityID/$_countyID"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Response response = snapshot.data;
            //发生错误
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            _county = getCountyList(response.data);
            //请求成功，通过项目信息构建用于显示项目名称的ListView
            return ListView.builder(
              itemCount: _county.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ListTile(
                    title: Text("${_county[index].name}"),
                  ),
                  onTap: () {
                    _saveCityID(_county[index].weatherId);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MainPage(
                        cityID: _county[index].weatherId,
                      );
                    }));
                  },
                );
              },
            );
          }
          // 请求未完成时弹出loading
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
