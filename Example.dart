import 'dart:async';
import 'dart:convert';

import 'package:api/Models/border.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<NewOne1> fetchNewOne1() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return NewOne1.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }

}

class Abcd extends StatefulWidget {
  const Abcd({Key? key}) : super(key: key);

  @override
  State<Abcd> createState() => _AbcdState();
}

class _AbcdState extends State<Abcd> {
  late Future<NewOne1> futureNewOne1;

  @override
  void initState() {
    super.initState();
    futureNewOne1 = fetchNewOne1();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<NewOne1>(
          future: futureNewOne1,
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError)
              {
                return Text('${snapshot.error}');
              }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}



