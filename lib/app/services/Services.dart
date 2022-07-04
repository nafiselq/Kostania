import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rentamate_apps/app/model/space.dart';
import 'package:rentamate_apps/app/model/space_model.dart';

class Services {
  Future<List<Space>> getRecommended() async {
    var result = await http
        .get(Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces'));
    // print(result.statusCode);
    // print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((data) => Space.fromJson(data)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
