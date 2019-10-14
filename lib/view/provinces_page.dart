import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cool_weather/bean/province.dart';
import 'city_page.dart';

class ProvincesPageWidget extends StatefulWidget {
  ProvincesPageWidget({Key key}) : super(key: key);

  @override
  ProvincesPageStateWidget createState() => new ProvincesPageStateWidget();
}

class ProvincesPageStateWidget extends State<ProvincesPageWidget> {
  List<Province> provinceList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text(
            "省份",
            style: TextStyle(fontSize: 25.0),
          ),
        ),
        body: FutureBuilder(
          future: Dio().get("http://guolin.tech/api/china"),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Response response = snapshot.data;
              //发生错误
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              provinceList = getProvinceList(response.data);
              //请求成功，通过项目信息构建用于显示项目名称的ListView
              return ListView.builder(
                itemCount: provinceList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ListTile(
                      title: Text("${provinceList[index].name}"),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityPageWidget(
                          provinceID: provinceList[index].id,
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
        ));
  }
}
