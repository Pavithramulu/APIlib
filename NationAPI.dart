import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/Nation.dart';


class NationAPI extends StatefulWidget {
  const NationAPI({Key? key}) : super(key: key);

  @override
  _NationAPIState createState() => _NationAPIState();
}

class _NationAPIState extends State<NationAPI> {

  late Future<List<Places >> _future;

  @override
  void initState() {
    super.initState();

    _future = fetchPlaces();
  }

  Future<List<Places>> fetchPlaces() async {
    var response = await http.get(Uri.parse(apiUrl));
    //print(response);
    return (json.decode(response.body)['places'] as List).map((e) =>
        Places.fromJson(e)).toList();
  }

  final String apiUrl = "https://api.zippopotam.us/us/33162";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('API - Place details')),
        ),
        body: Container(
          color: Colors.grey.shade50,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<List<Places>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Places> entryList = snapshot.data as List<Places>;
                return ListView.builder(
                    itemCount: entryList.length,
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
                                const Text('Palce Name : '),
                                //Text(entryList[index].aPI.toString()),
                                RichText(text: TextSpan(text: entryList[index].placeName.toString(),)),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Longitude : '),
                                //Text(entryList[index].aPI.toString()),
                                RichText(text: TextSpan(text: entryList[index].longitude.toString())),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('State : '),
                                //Text(entryList[index].aPI.toString()),
                                RichText(text: TextSpan(text: entryList[index].state.toString())),
                              ],
                            ),
                            Row(
                              children: [
                                const Text('Latitude : '),
                                //Text(entryList[index].aPI.toString()),
                                RichText(text: TextSpan(text: entryList[index]. latitude.toString())),
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

