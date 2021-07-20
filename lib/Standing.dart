import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StandingsPage extends StatefulWidget {
  @override
  _StandingsPageState createState() => _StandingsPageState();
}

class _StandingsPageState extends State<StandingsPage> {
  List standings;

  Future fetchNews()async{
    http.Response response;
    response = await http.get(Uri.parse("https://fly.sportsdata.io/v3/nba/scores/json/Standings/"
        "2021?key=74019eae9e404d2e9b9e5b707922b7f9"));
    setState(() {
      if (response.statusCode==200){
        standings = json.decode(response.body);
      }
    });
  }

  @override
  void initState() {
    fetchNews();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body:
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child: Text(standings[index]["City"], style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(standings[index]["Name"], style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Conference : ",
                              style: TextStyle(fontSize: 20, color: Colors
                                  .black, fontWeight: FontWeight.bold,),),
                            Container(
                              child: Text(
                                standings[index]["Conference"], style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("W : ",
                              style: TextStyle(fontSize: 20, color: Colors
                                  .black, fontWeight: FontWeight.bold,),),
                            Container(
                              child: Text(
                                standings[index]["Wins"].toString(), style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("L : ",
                              style: TextStyle(fontSize: 20, color: Colors
                                  .black, fontWeight: FontWeight.bold,),),
                            Container(
                              child: Text(
                                standings[index]["Losses"].toString(), style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Conference Rank : ",
                              style: TextStyle(fontSize: 20, color: Colors
                                  .black, fontWeight: FontWeight.bold,),),
                            Container(
                              child: Text(
                                standings[index]["ConferenceRank"].toString(), style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(
                              height: 10,
                              width: double.infinity,
                              child: Divider(color: Colors.red.shade900, thickness: 5,),
                            ),
                          ],

                        ),
                      ]
                  ),

                )
              ],

            );

          },

        )
    )
    );
  }
}
