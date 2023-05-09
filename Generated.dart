import 'dart:async';
import 'dart:convert';
import 'package:api/Models/3.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

Future<Generated> fetchGenerated() async {

  final response = await http.
  get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

  if (response.statusCode == 200)
    {
      return Generated.fromJson(jsonDecode(response.body));
    }
  else
  {
  throw Exception('Failed to load ');
  }
}

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {

  @override
  void iniState() {
    super.initState();
    fetchGenerated();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('API Fetch Example'),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Column(
        children: [
          Center(
            child: FutureBuilder<Generated> (
                future:  fetchGenerated(),
                builder: (context,snapshot) {

                  if (snapshot.hasData)
                  {
                    return Text(snapshot.data!.message.toString(),
                      style:TextStyle(fontSize: 20,color: Colors.lightBlueAccent,fontWeight: FontWeight.w500),);
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
            child: FutureBuilder<Generated> (
                future:  fetchGenerated(),
                builder: (context,snapshot) {

                  if (snapshot.hasData)
                  {
                    return Text(snapshot.data!.status.toString(),
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



