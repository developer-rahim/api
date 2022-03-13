import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_developer_test/homePage/detailScreen.dart';
import 'package:flutter_developer_test/model/model.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List list = ['Allah', 'rasol', 'Nobi', 'aaaaaaaa'];
  List<WeatherDataModel> datalist = <WeatherDataModel>[];
  getdata() async {
    var url = await 'https://picsum.photos/v2/list?page=pageNumber&limit=20';
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    print(data);
    setState(() {
      data.forEach((element) {
        WeatherDataModel weatherDataModel = new WeatherDataModel();
        weatherDataModel = WeatherDataModel.fromJson(element);
        datalist.add(weatherDataModel);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: datalist.length,
            itemBuilder: ((context, index) {
              var datalists = datalist[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailScreen()));
                },
                child: Card(
                  child: Container(
                      child: ListTile(
                    leading: CircleAvatar(
                      child: Text(datalists.author.toString()[0]),
                    ),
                    title: Text(datalists.id.toString()),
                    subtitle: Text(datalists.author.toString()),
                  )),
                ),
              );
            })),
      ),
    );
  }
}
