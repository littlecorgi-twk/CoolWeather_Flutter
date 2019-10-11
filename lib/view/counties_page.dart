import 'package:flutter/material.dart';
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
  List<County> _countiesList;
  List<County> _county;

  getHttp() async {
    try {
      HttpClient httpClient = new HttpClient();
      var uri = new Uri.http(
        'guolin.tech',
        '/api/china/$_cityID/$_countyID',
      );
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(Utf8Decoder()).join();
      final jsonResponse = json.decode(responseBody.toString());
      _countiesList = getCountyList(jsonResponse);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _cityID = widget.cityID;
    _countyID = widget.countyID;
    getCity();
    super.initState();
  }

  void getCity() async {
    await getHttp();
    setState(() {
      _county = _countiesList;
    });
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
      body: _county == null
          ? new Text("正在请求")
          : new ListView.builder(
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
            ),
    );
  }
}
