import 'dart:convert';

import 'package:folkatech_test/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MenuProvider extends ChangeNotifier {
  getData() async {
    var result = await http
        .get('https://mocki.io/v1/52c41978-6e31-4ea3-b917-01899e3ed373');

    //Cek apakah status sudah OK untuk mengambil data dari API, convert JSON menjadi LIST
    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Menu> menu = data.map((item) => Menu.fromJson(item)).toList();
      return menu;
    } else {
      return <Menu>[];
    }
  }
}
