import 'dart:convert';
import 'package:api/Models/ActivityClass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Models/org.dart';


class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {

  List<Entries> listEntries = [];
  List<Act> actList = [];

  Future<List<Entries>> fetchActivity() async {
    var resp =  await http.
    get(Uri.parse('https://www.boredapi.com/api/activity'));

    print(resp.statusCode );

    if(resp.statusCode == 200)
      {
        print(jsonDecode(resp.body));
       // var data = jsonDecode(resp.body);
        var data = jsonDecode(resp.body);
        setState(() {
         actList.add(Act.fromJson(data));
        });
      }
    return listEntries;
  }

   Future<List<Entries>> getb() async {

    var resp = await http.get(Uri.parse('https://api.publicapis.org/entries'));
    var data = jsonDecode(resp.body);

      (data["entries"] as List).forEach((s) {
        listEntries.add(Entries.fromJson(s));
        });

    return listEntries;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: ListView.builder(
          itemCount: listEntries.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.list),
                trailing:  Text(
                  listEntries[index].link.toString(),
                  style: const TextStyle(color: Colors.pinkAccent, fontSize: 15),
                ),
                title: Text(listEntries[index].link.toString()));
          }),
    );
  }
}
