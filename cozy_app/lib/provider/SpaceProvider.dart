import 'dart:convert';

import 'package:cozy_app/model/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  final baseUrl = "https://bwa-cozy-api.vercel.app";

  List<Space> spaces = [];

  getRecommendedSpace() async {
    var result = await http.get(Uri.parse("${baseUrl}/recommended-spaces"));

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((e) => Space.fromJson(e)).toList();
      this.spaces = spaces;
      notifyListeners();
    }
  }
}
