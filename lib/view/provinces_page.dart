import 'package:flutter/material.dart';
import 'package:cool_weather/bean/province.dart';
import 'city_page.dart';
import 'dart:convert';
import 'dart:io';

class ProvincesPageWidget extends StatefulWidget {
  ProvincesPageWidget({Key key}) : super(key: key);

  @override
  ProvincesPageStateWidget createState() => new ProvincesPageStateWidget();
}

class ProvincesPageStateWidget extends State<ProvincesPageWidget> {
  List<Province> _provinces;
  ProvinceList provinceList = ProvinceList();

  getHttp() async {
    try {
      HttpClient httpClient = new HttpClient();
      var uri = new Uri.http('guolin.tech', '/api/china');
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(Utf8Decoder()).join();
      final jsonResponse = json.decode(responseBody.toString());
      provinceList = ProvinceList.fromJson(jsonResponse);
      return provinceList;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getProvince();
    super.initState();
  }

  void getProvince() async {
    provinceList = await getHttp();
    setState(() {
      _provinces = provinceList.provinces;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "省份",
          style: TextStyle(fontSize: 25.0),
        ),
      ),
      body: _provinces == null
          ? new Text("正在请求")
          : new ListView.builder(
              itemCount: _provinces.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ListTile(
                    title: Text("${_provinces[index].name}"),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CityPageWidget(cityID: _provinces[index].id);
                    }));
                  },
                );
              },
            ),
    );
  }
}
