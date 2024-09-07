import 'dart:convert';

import 'package:untitled/config/config.dart';
import 'package:untitled/model/hoaxes.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/model/hospitals.dart';
import 'package:untitled/model/news.dart';
import 'package:untitled/model/stats.dart';

class ApiService {
  Future<List<Hoaxes>?> getHoaxes() async {
    var url = Uri.parse('${baseURL}hoaxes');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((hoaxes) => Hoaxes.fromJson(hoaxes)).toList();
    } else {
      print('Request gagal dengan status: ${response.statusCode}.');
      return null;
    }
  }

  Future<List<Hospitals>?> getHospitals() async {
    var url = Uri.parse('${baseURL}hospitals');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((hospitals) => Hospitals.fromJson(hospitals)).toList();
    } else {
      print('Request gagal dengan status: ${response.statusCode}.');
      return null;
    }
  }

  Future<List<News>?> getNews() async {
    var url = Uri.parse('${baseURL}news');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((news) => News.fromJson(news)).toList();
    } else {
      print('Request gagal dengan status: ${response.statusCode}.');
      return null;
    }
  }

  Future<Stats?> getStats() async {
    var url = Uri.parse('${baseURL}stats');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      return statsFromJson(response.body);
    } else {
      print('Request gagal dengan status: ${response.statusCode}.');
      return null;
    }
  }
}
