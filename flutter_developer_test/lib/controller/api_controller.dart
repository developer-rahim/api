import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_developer_test/model/model.dart';
import 'package:http/http.dart' as http;

class ApiController extends ChangeNotifier {
  List<WeatherDataModel> datalist = <WeatherDataModel>[];
  getdata() async {
    var url = await 'https://picsum.photos/v2/list?page=pageNumber&limit=20';
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    print(data);
    data.forEach((element) {
      WeatherDataModel weatherDataModel = new WeatherDataModel();
      weatherDataModel = WeatherDataModel.fromJson(element);
      datalist.add(weatherDataModel);

      notifyListeners();
    });
  }
}
