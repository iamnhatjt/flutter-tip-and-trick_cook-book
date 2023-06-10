import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' as http;

mixin CanDownLoadAndParsingJson {
  Uri get uri;
  Future<dynamic> downloadjson() async {
    final call = await http.get(uri);
    return jsonDecode(call.body);
  }

  Future<List<Map<String, dynamic>>> jsonArray() async {
    final json = await downloadjson();
    return json.cast<Map<String, dynamic>>();
  }
}
