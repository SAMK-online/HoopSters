import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class PlayersPage extends StatefulWidget{
  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage>{
  List players;

  Future getPlayers() async{
    http.Response response;
    response = await http.get(Uri.parse("https://fly.sportsdata.io/v3/nba/scores/json/Players?key=74019eae9e404d2e9b9e5b707922b7f9"));
    setState(() {
      if (response.statusCode==200){
        players= json.decode(response.body);
      }}
    );
  }
  @override
  void initState() {
    getPlayers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body:
        ListView.builder(
          shrinkWrap: true,
          itemCount: players.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                     children: [
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                             players[index]["YahooName"], style: TextStyle(
                              fontSize: 20,
                               color: Colors.red.shade900,
                                 fontWeight: FontWeight.bold),),
                            ],
                        ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Team : ",
                              style: TextStyle(fontSize: 20, color: Colors
                                  .black, fontWeight: FontWeight.bold,),),
                            Container(
                              child: Text(
                                players[index]["Team"], style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Position : ",
                              style: TextStyle(fontSize: 20, color: Colors
                                  .black, fontWeight: FontWeight.bold,),),
                            Container(
                              child: Text(
                                players[index]["Position"].toString(), style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Height : ",
                              style: TextStyle(fontSize: 20, color: Colors
                                  .black, fontWeight: FontWeight.bold,),),
                            Container(
                              child: Text(
                                players[index]["Height"].toString(), style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Jersey No. : ",
                              style: TextStyle(fontSize: 20, color: Colors
                                  .black, fontWeight: FontWeight.bold,),),
                            Container(
                              child: Text(
                                players[index]["Jersey"].toString(), style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.bold),),
                            ),
                           ]
                           ),
                         /*Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    Image.network("PhotoUrl")]
                         ),*/
                            SizedBox(
                              height: 10,
                              width: double.infinity,
                              child: Divider(color: Colors.red.shade900, thickness: 5,),
                            ),
                          ],

                        ),
                      )
                  ]
                  ),

                ),
              ],

            );

          },

        )
    )
    );
  }
}
