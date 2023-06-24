import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cookbook/flutter_networking/fetch_data_from_internet/album_model.dart';
import 'package:http/http.dart' as http;

// make a request.
Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('some thing wrong with internet');
  }
}

class FetchDataFromInternetWidget extends StatefulWidget {
  const FetchDataFromInternetWidget({super.key});

  @override
  State<FetchDataFromInternetWidget> createState() =>
      _FetchDataFromInternetWidgetState();
}

class _FetchDataFromInternetWidgetState
    extends State<FetchDataFromInternetWidget> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch data from internet!'),
      ),
      body: FutureBuilder<Album>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('got something wrong');
          }
          return CircularProgressIndicator();
        },
        future: futureAlbum,
      ),
    );
  }
}
