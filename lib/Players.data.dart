import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PlayersPage extends StatefulWidget {
  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  List players;
  bool _loading;

  Future getPlayers() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://fly.sportsdata.io/v3/nba/scores/json/Players?key=74019eae9e404d2e9b9e5b707922b7f9"));
    setState(() {
      _loading = false;
      if (response.statusCode == 200) {
        players = json.decode(response.body);
      }
    });
  }

  @override
  void initState() {
    getPlayers();
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
                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 9), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        players[index]["YahooName"],
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.red.shade900,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Image.network(
                                          players[index]["PhotoUrl"].toString(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Team : ",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    players[index]["Team"],
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color:
                                                            Colors.red.shade900,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Position : ",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    players[index]["Position"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color:
                                                            Colors.red.shade900,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Height : ",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    players[index]["Height"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color:
                                                            Colors.red.shade900,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Jersey No. : ",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      players[index]["Jersey"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors
                                                              .red.shade900,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(15),
                                    child: SizedBox(
                                      height: 10,
                                      width: double.infinity,
                                      child: Divider(
                                        color: Colors.red.shade900,
                                        thickness: 5,
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )));
  }
}
