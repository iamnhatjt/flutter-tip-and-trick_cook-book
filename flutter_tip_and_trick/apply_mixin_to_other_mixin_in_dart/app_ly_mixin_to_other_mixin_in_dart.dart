import 'package:http/http.dart' as http;

mixin HasUri {
  Uri get uri;
}

mixin DownloadAble on HasUri {
  Future<String> download() => http.get(uri).then((value) => value.body);
}

class Todo with HasUri, DownloadAble {
  final Uri uri = Uri.http('https://jsonplaceholder.typicode.com', '/todo/');
}
