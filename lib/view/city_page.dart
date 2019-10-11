import 'package:flutter/material.dart';
import 'counties_page.dart';
import 'package:cool_weather/bean/city.dart';
import 'dart:convert';
import 'dart:io';

class CityPageWidget extends StatefulWidget {
  CityPageWidget({Key key, this.cityID}) : super(key: key);

  final int cityID;

  @override
  CityPageWidgetState createState() => CityPageWidgetState();
}

class CityPageWidgetState extends State<CityPageWidget> {
  int _cityID;
  CityList _cityList = CityList();
  List<City> _cities;

  getHttp() async {
    try {
      HttpClient httpClient = new HttpClient();
      var uri = new Uri.http(
        'guolin.tech',
        '/api/china/$_cityID',
      );
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(Utf8Decoder()).join();
      final jsonResponse = json.decode(responseBody.toString());
      CityList cityList = CityList.fromJson(jsonResponse);
      return cityList;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _cityID = widget.cityID;
    getCity();
    super.initState();
  }

  void getCity() async {
    _cityList = await getHttp();
    setState(() {
      _cities = _cityList.cities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "城市",
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      body: _cities == null
          ? new Text("正在请求")
          : new ListView.builder(
              itemCount: _cities.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ListTile(
                    title: Text("${_cities[index].name}"),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CountiesPageWidget(
                        cityID: _cityID,
                        countyID: _cities[index].id,
                      );
                    }));
                  },
                );
              },
            ),
    );
  }
}
