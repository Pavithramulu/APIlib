import 'dart:convert';
import 'package:api/Models/ActivityClass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Models/6.dart';
import 'Models/org.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final String apiUrl = "https://gorest.co.in/public/v1/users";

  Future<List<User>> fetchUsers() async {
    var response = await http.get(Uri.parse(apiUrl));
    print(response);
    return (json.decode(response.body)['data'] as List)
        .map((e) => User.fromJson(e))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data '),
      ),
      body: Container(
        color: Colors.grey,
        child: FutureBuilder<List<User>> (
          future: fetchUsers(),
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              List<User> usersList = snapshot.data as List<User>;
              if(usersList.isNotEmpty) {
                return ListView.builder(
                itemCount: usersList.length,
                itemBuilder : (context,index) {
                  return Column(
                    children: [
                      Text(usersList[index].name),
                      Text(usersList[index].email),
                      Text(usersList[index].gender),
                      Text(usersList[index].status),
                    ],
                  );
                }
              );
              }
              return const Text("No Records Found");
            }
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return const Text('error');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

}

