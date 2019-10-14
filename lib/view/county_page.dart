import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'main_page.dart';
import 'package:cool_weather/bean/county.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountyPageWidget extends StatefulWidget {
  final int provinceID;
  final int cityID;

  CountyPageWidget({Key key, this.provinceID, this.cityID}) : super(key: key);

  @override
  CountyPageWidgetState createState() => CountyPageWidgetState();
}

class CountyPageWidgetState extends State<CountyPageWidget> {
  int _provinceID;
  int _cityID;
  List<County> _county;

  @override
  void initState() {
    _provinceID = widget.provinceID;
    _cityID = widget.cityID;
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
        future: Dio().get("http://guolin.tech/api/china/$_provinceID/$_cityID"),
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
