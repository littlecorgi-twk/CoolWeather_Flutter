import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cool_weather/bean/city.dart';
import 'package:cool_weather/view/counties_page.dart';

class CityPageWidget extends StatefulWidget {
  CityPageWidget({Key key, this.cityID}) : super(key: key);

  final int cityID;

  @override
  CityPageWidgetState createState() => CityPageWidgetState();
}

class CityPageWidgetState extends State<CityPageWidget> {
  int _cityID;
  CityList _cityList = CityList();

  @override
  void initState() {
    _cityID = widget.cityID;
    super.initState();
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
      body: FutureBuilder(
        future: Dio().get("http://guolin.tech/api/china/$_cityID"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Response response = snapshot.data;
            //发生错误
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            _cityList = CityList.fromJson(response.data);
            //请求成功，通过项目信息构建用于显示项目名称的ListView
            return ListView.builder(
              itemCount: _cityList.cities.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ListTile(
                    title: Text("${_cityList.cities[index].name}"),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CountiesPageWidget(
                        cityID: _cityID,
                        countyID: _cityList.cities[index].id,
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
