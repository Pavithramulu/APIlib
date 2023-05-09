import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Models/1.dart';

Future<NewTwo>  fetchNewTwo() async {

  final response = await http.get(Uri.parse('https://catfact.ninja/fact'));
  print(response.statusCode);
  if (response.statusCode == 200) {
    return NewTwo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class Abcd1 extends StatefulWidget {
  const Abcd1({Key? key}) : super(key: key);

  @override
  State<Abcd1> createState() => _Abcd1State();
}

class _Abcd1State extends State<Abcd1> {


  @override
  void iniState() {
    super.initState();
    fetchNewTwo();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: FutureBuilder<NewTwo> (
          future: fetchNewTwo(),
          builder: (context,snapshot){
            if (snapshot.hasData)
            {
              return Text(snapshot.data!.fact.toString());
            }
            else if (snapshot.hasError)
            {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}
