import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'Models/4.dart';

Future<SWcompany> fetchSWcompany() async {

  final response = await http.
  get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));
  if(response.statusCode == 200) {
    return SWcompany.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load ');
  }
}

class softWare extends StatefulWidget {
  const softWare({Key? key}) : super(key: key);

  @override
  State<softWare> createState() => _softWareState();
}

class _softWareState extends State<softWare> {

  @override
  void iniState() {
    super.initState();
    fetchSWcompany();
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
            child: FutureBuilder<SWcompany> (
                future:  fetchSWcompany(),
                builder: (context,snapshot) {

                  if (snapshot.hasData)
                  {
                    return Text(snapshot.data!.type.toString(),
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
          Center(
            child: FutureBuilder<SWcompany> (
                future:  fetchSWcompany(),
                builder: (context,snapshot) {

                  if (snapshot.hasData)
                  {
                    return Text(snapshot.data!.setup.toString(),
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
          Center(
            child: FutureBuilder<SWcompany> (
                future:  fetchSWcompany(),
                builder: (context,snapshot) {

                  if (snapshot.hasData)
                  {
                    return Text(snapshot.data!.punchline.toString(),
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
          Center(
            child: FutureBuilder<SWcompany> (
                future:  fetchSWcompany(),
                builder: (context,snapshot) {

                  if (snapshot.hasData)
                  {
                    return Text(snapshot.data!.id.toString(),
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


