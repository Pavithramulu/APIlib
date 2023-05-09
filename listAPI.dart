import 'dart:convert';
import 'dart:async';
import 'package:api/Models/list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class UserAPI extends StatefulWidget {
  const UserAPI({Key? key}) : super(key: key);

  @override
  _UserAPIState createState() => _UserAPIState();
}

class _UserAPIState extends State<UserAPI> {

  late Future<List<Entries >> _future;

  @override
  void initState() {
    super.initState();

    _future = fetchEntries();
  }

  Future<List<Entries>> fetchEntries() async {
    var response = await http.get(Uri.parse(apiUrl));
    //print(response);
    return (json.decode(response.body)['entries'] as List).map((e) =>
        Entries.fromJson(e)).toList();
  }

  final String apiUrl = "https://api.publicapis.org/entries";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('API List Entries')),
        ),
        body: Container(
          color: Colors.grey.shade50,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<List<Entries>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Entries> entryList = snapshot.data as List<Entries>;
                return ListView.builder(
                    itemCount: entryList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        color: Colors.pink.shade50,
                        width: 400,
                        height: 80,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text('API : '),
                                //Text(entryList[index].aPI.toString()),
                                RichText(text: TextSpan(text: entryList[index].aPI.toString())),
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                    child: Text('Link:')),
                                Text(entryList[index].link.toString()),
                                RichText(text: TextSpan(text: entryList[index].aPI.toString())),

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
        ));
  }
}






