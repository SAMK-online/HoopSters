import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List Schedule;
  bool _loading;

  Future getschedule() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://fly.sportsdata.io/v3/nba/scores/json/Games/2021POST?key=74019eae9e404d2e9b9e5b707922b7f9"));
    setState(() {
      _loading = false;
      if (response.statusCode == 200) {
        Schedule = json.decode(response.body);
      }
    });
  }

  @override
  void initState() {
    getschedule();
    _loading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 9), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                child: Text(
                                  Schedule[index]["HomeTeam"],
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                child: Text(
                                  "VS",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                child: Text(
                                  Schedule[index]["AwayTeam"],
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Status: ",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  child: Text(
                                    Schedule[index]["Status"].toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Channel: ",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  child: Text(
                                    Schedule[index]["Channel"].toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Date: ",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              child: Text(
                                Schedule[index]["Day"].toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                );
              }),
    ));
  }
}
