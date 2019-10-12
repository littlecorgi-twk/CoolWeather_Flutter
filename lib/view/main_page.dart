import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cool_weather/bean/now_weather.dart';
import 'package:cool_weather/bean/forecast_weather.dart';
import 'package:cool_weather/bean/lifestyle_weather.dart';
import 'package:cool_weather/view/provinces_page.dart';

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
  final String key = "cd09fcf733ee429aade1d41b467e1c1f";

  @override
  void initState() {
    _cityID = widget.cityID;
    super.initState();
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
    return FutureBuilder(
      future: Dio().get(
          "https://free-api.heweather.net/s6/weather/now?location=$_cityID&key=$key"),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Response response = snapshot.data;
          //发生错误
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          _nowWeather = NowWeather.fromJson(response.data);
          //请求成功，通过项目信息构建用于显示项目名称的ListView
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: new GestureDetector(
                child: Icon(
                  Icons.home,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProvincesPageWidget();
                  }));
                },
              ),
              centerTitle: true,
              title: Text(
                "${_nowWeather.heWeather6[0].basic.location}",
                style: TextStyle(fontSize: 25.0),
              ),
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
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
        // 请求未完成时弹出loading
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: new GestureDetector(
              child: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProvincesPageWidget();
                }));
              },
            ),
            centerTitle: true,
            title: CircularProgressIndicator(),
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _weatherList() {
    return Column(children: <Widget>[
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
      FutureBuilder(
        future: Dio().get(
            "https://free-api.heweather.net/s6/weather/forecast?location=$_cityID&key=$key"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Response response = snapshot.data;
            //发生错误
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            _forecastWeather = ForecastWeather.fromJson(response.data);
            //请求成功，通过项目信息构建用于显示项目名称的ListView
            return ListView.builder(
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
                });
          }
          // 请求未完成时弹出loading
          return CircularProgressIndicator();
        },
      ),
    ]);
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
        FutureBuilder(
            future: Dio().get(
                "https://free-api.heweather.net/s6/weather/lifestyle?location=$_cityID&key=$key"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Response response = snapshot.data;
                //发生错误
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                _lifestyleWeather = LifestyleWeather.fromJson(response.data);
                //请求成功，通过项目信息构建用于显示项目名称的ListView
                return ListView.builder(
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
                );
              }
              return CircularProgressIndicator();
            }),
      ],
    );
  }
}
