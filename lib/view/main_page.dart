import 'package:flutter/material.dart';
import 'package:cool_weather/bean/now_weather.dart';
import 'package:cool_weather/bean/forecast_weather.dart';
import 'package:cool_weather/bean/lifestyle_weather.dart';
import 'dart:convert';
import 'dart:io';

class MainPage extends StatefulWidget {
  final String cityID;

  MainPage({Key key, this.cityID}) : super(key: key);

  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  String _cityID;
  NowWeather _nowWeather;
  ForecastWeather _forecastWeather;
  LifestyleWeather _lifestyleWeather;
  final String host = "";
  final String key = "cd09fcf733ee429aade1d41b467e1c1f";
  List<String> dates = ["2019/10/01", "2019/10/02", "2019/10/03"];
  List<String> temperatures = ["29/14", "30/18", "29/18"];
  List<String> texts = ["阴", "晴", "雨"];

  @override
  void initState() {
    _cityID = widget.cityID;
    setNowWeather();
    setForecastWeather();
    setLifestyleWeather();
    super.initState();
  }

  getHttp(int flag) async {
    try {
      HttpClient httpClient = new HttpClient();
      String type;
      if (flag == 0) type = "now";
      if (flag == 1) type = "forecast";
      if (flag == 2) type = "lifestyle";
      var uri = new Uri.https(
        "free-api.heweather.net",
        "/s6/weather/$type",
        {
          'location': '$_cityID',
          'key': '$key',
        },
      );
      print(uri.toString());
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(Utf8Decoder()).join();
      return responseBody;
    } catch (e) {
      print(e);
    }
  }

  getNowWeather(String responseBody) async {
    final jsonResponse = json.decode(responseBody.toString());
    NowWeather nowWeather = NowWeather.fromJson(jsonResponse);
    return nowWeather;
  }

  getForecastWeather(String responseBody) async {
    final jsonResponse = json.decode(responseBody.toString());
    ForecastWeather forecastWeather = ForecastWeather.fromJson(jsonResponse);
    return forecastWeather;
  }

  getLifestyleWeather(String responseBody) async {
    final jsonResponse = json.decode(responseBody.toString());
    LifestyleWeather lifeStyleWeather = LifestyleWeather.fromJson(jsonResponse);
    print(lifeStyleWeather.heWeather6[0].basic.cnty);
    return lifeStyleWeather;
  }

  void setNowWeather() async {
    NowWeather nowWeather = await getNowWeather(await getHttp(0));
    setState(() {
      _nowWeather = nowWeather;
    });
  }

  void setForecastWeather() async {
    ForecastWeather forecastWeather =
        await getForecastWeather(await getHttp(1));
    setState(() {
      _forecastWeather = forecastWeather;
    });
  }

  void setLifestyleWeather() async {
    LifestyleWeather lifestyleWeather =
        await getLifestyleWeather(await getHttp(2));
    setState(() {
      _lifestyleWeather = lifestyleWeather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("http://blog.mrabit.com/bing/today"),
          fit: BoxFit.cover,
        ),
      ),
      child: _weatherBody(),
    );
  }

  Widget _weatherBody() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        title: _nowWeather == null
            ? Text("正在加载")
            : Text(
                "${_nowWeather.heWeather6[0].basic.location}",
                style: TextStyle(fontSize: 25.0),
              ),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            child: _nowWeather == null
                ? Text("正在加载")
                : Text(
                    "${_nowWeather.heWeather6[0].update.loc}",
                    textAlign: TextAlign.center,
                  ),
          )
        ],
      ),
      body: _nowWeather == null
          ? Text("正在加载")
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${_nowWeather.heWeather6[0].now.tmp}°C",
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${_nowWeather.heWeather6[0].now.condTxt}",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      bottom: 15.0,
                    ),
                    child: Container(
                      color: Colors.black54,
                      child: _weatherList(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    child: Container(
                      color: Colors.black54,
                      child: _atmosphereList(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      left: 15.0,
                      right: 15.0,
                      bottom: 15.0,
                    ),
                    child: Container(
                      color: Colors.black54,
                      child: _lifestyleList(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _weatherList() {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "预报",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        _forecastWeather == null
            ? Text("正在加载")
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _forecastWeather.heWeather6[0].dailyForecast.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "${_forecastWeather.heWeather6[0].dailyForecast[index].date}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "${_forecastWeather.heWeather6[0].dailyForecast[index].condTxtD}/${_forecastWeather.heWeather6[0].dailyForecast[index].condCodeN}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "${_forecastWeather.heWeather6[0].dailyForecast[index].tmpMax}/${_forecastWeather.heWeather6[0].dailyForecast[index].tmpMin}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }),
      ],
    );
  }

  Widget _atmosphereList() {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "空气质量",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //横轴三个子widget
              childAspectRatio: 2 //显示区域宽高相等
              ),
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "${_nowWeather.heWeather6[0].now.vis}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
                Text(
                  "能见度",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  "${_nowWeather.heWeather6[0].now.hum}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
                Text(
                  "湿度",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget _lifestyleList() {
    for (Lifestyle lifestyle in _lifestyleWeather.heWeather6[0].lifestyle) {
      print("${lifestyle.txt}");
    }

    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "生活建议",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        _lifestyleWeather == null
            ? Text("正在加载")
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _lifestyleWeather.heWeather6[0].lifestyle.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${_lifestyleWeather.heWeather6[0].lifestyle[index].brf}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${_lifestyleWeather.heWeather6[0].lifestyle[index].txt}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ],
    );
  }
}
