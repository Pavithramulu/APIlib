import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  late Future<List<User>> _future;

  @override
  void initState() {
    super.initState();

    _future = fetchUsers();
  }

  // Future<List<User>> fetchUsers() async {
  //   var response = await http.get(Uri.parse(apiUrl));
  //   return (json.decode(response.body)['data'] as List)
  //       .map((e) => User.fromJson(e))
  //       .toList();
  // }


  // static Future<List<results>> getAll(String gender) async {
  //   List<results> list = [];
  //   var data = await httpGet(
  //       "https://randomuser.me/api/");
  //   data = jsonDecode(data);
  //   //return list;
  //   if (data["success"] == true &&
  //       data["results"] is List &&
  //       (data["results"] as List).isNotEmpty) {
  //     (data["results"] as List).forEach((s) {
  //       list.add(results.fromMap(s));
  //     });
  //   }
  //   print(list);
  //   return list;
  // }

  Future<List<User>> fetchUsers() async {
    var response = await http.get(Uri.parse(apiUrl));
    return (json.decode(response.body)['results'] as List).map((e) =>
        User.fromJson(e)).toList();
  }

  final String apiUrl = "https://randomuser.me/api/";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Screen'),
        ),
        body: Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<List<User>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<User> users = snapshot.data as List<User>;
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            // Text(users[index].name),
                            Text(users[index].gender),
                            //Text(users[index].gender),
                          ],
                        ),
                      );
                    }
                );
              }
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return Text('error');
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }


}

class User {
  //int id;
  //String name;
  String gender;
  // String gender;

  User(
      {
        //required this.id,
        //  required this.name,
        required this.gender,
        //required this.gender
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      // id: json['id'],
      //name: json['name'],
      gender: json['gender'].toString(),
      //gender: json['gender']
    );
  }
}