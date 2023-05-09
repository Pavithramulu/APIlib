import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/details.dart';

class EmpDetailsAPI extends StatefulWidget {
  const EmpDetailsAPI({Key? key}) : super(key: key);

  @override
  State<EmpDetailsAPI> createState() => _EmpDetailsAPIState();
}

class _EmpDetailsAPIState extends State<EmpDetailsAPI> {

  late Future<List<Results >> _future;

  @override
  void initState() {
    super.initState();

    _future = fetchResults();
  }

  Future<List<Results>> fetchResults() async {
    var response = await http.get(Uri.parse(apiUrl));
    print(response);
    return (json.decode(response.body)['results'] as List).map((e) =>
        Results.fromJson(e)).toList();
  }

  final String apiUrl = "https://randomuser.me/api/";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('API - Employee Details API')),
      ),

      body: Container(
        color: Colors.grey.shade50,
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<List<Results>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Results> detailList = snapshot.data as List<Results>;
              return ListView.builder(
                  itemCount: detailList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      color: Colors.pink.shade50,
                      width: 400,
                      height: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text('Gender : '),
                              //Text(entryList[index].aPI.toString()),
                              RichText(text: TextSpan(text: detailList[index].gender.toString(),)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Name : '),
                              //Text(entryList[index].aPI.toString()),
                              RichText(text: TextSpan(text: detailList[index].name.toString(),)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Location : '),
                              //Text(entryList[index].aPI.toString()),
                              RichText(text: TextSpan(text: detailList[index].location.toString(),)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Email : '),
                              //Text(entryList[index].aPI.toString()),
                              RichText(text: TextSpan(text: detailList[index].email.toString(),)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Login : '),
                              //Text(entryList[index].aPI.toString()),
                              RichText(text: TextSpan(text: detailList[index].login.toString(),)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('DOB : '),
                              //Text(entryList[index].aPI.toString()),
                              RichText(text: TextSpan(text: detailList[index].dob.toString(),)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Registered : '),
                              //Text(entryList[index].aPI.toString()),
                              RichText(text: TextSpan(text: detailList[index].registered.toString(),)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Phone : '),
                              //Text(entryList[index].aPI.toString()),
                              RichText(text: TextSpan(text: detailList[index].phone.toString(),)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Cell : '),
                              //Text(entryList[index].aPI.toString()),
                              RichText(text: TextSpan(text: detailList[index].cell.toString(),)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Id : '),
                              //Text(entryList[index].aPI.toString()),
                              RichText(text: TextSpan(text: detailList[index].id.toString(),)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Picture : '),
                              //Text(entryList[index].aPI.toString()),
                              RichText(text: TextSpan(text: detailList[index].picture.toString(),)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Nat : '),
                              //Text(entryList[index].aPI.toString()),
                              RichText(text: TextSpan(text: detailList[index].nat.toString(),)),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
              );
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
