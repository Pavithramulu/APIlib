import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'Models/5.dart';

Future<Travell> fetchTravell() async {

  final response = await http.
  get(Uri.parse('https://ipinfo.io/161.185.160.93/geo'));
  if(response.statusCode == 200) {
    return Travell.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load ');
  }
}

class softWare1 extends StatefulWidget {
  const softWare1({Key? key}) : super(key: key);

  @override
  State<softWare1> createState() => _softWare1State();
}

class _softWare1State extends State<softWare1> {

  @override
  void iniState() {
    super.initState();
    fetchTravell();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Fetch Data Example'),
      ),
      body: Column(
        children: [
          Center(
            child: FutureBuilder<Travell> (
                future:  fetchTravell(),
                builder: (context,snapshot) {

                  if (snapshot.hasData)
                  {
                    return Text(snapshot.data!.city.toString(),
                      style:TextStyle(fontSize: 25,color: Colors.lightBlueAccent,fontWeight: FontWeight.w500),);
                  }
                  //  else (snapshot.hasError)
                      {
                    return Text('${snapshot.error}',style: TextStyle(fontSize: 25),);
                  }
                  return const CircularProgressIndicator();
                }
            ),
          ),



        ],
      ),


    );
  }
}