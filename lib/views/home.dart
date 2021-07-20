import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  Map mapResonse;
  List news;
  /*List score;*/

  Future fetchNews()async{
    http.Response response;
    //http.Response response2;//
    response = await http.get(Uri.parse("https://fly.sportsdata.io/v3/nba/scores/json/News?key=74019eae9e404d2e9b9e5b707922b7f9"));
    /*response2 = await http.get(Uri.parse(
        "http://api.sportradar.us/nba/trial/v7/en/games/2021/06/30/schedule.json?api_key=xay4zt7vd78wgzkgaydtfk7t"));*/
    setState(() {
      if (response.statusCode==200){
        news = json.decode(response.body);
      }
      /*if(response2.statusCode==200){
        score = json.decode(response2.body);
      }*/
    });
  }

  @override
  void initState() {
    fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body:ListView.builder(
          shrinkWrap:true,
          itemCount:news.length,
          itemBuilder: (context,index){
            return Column(
              children: [
                Padding(
                  padding:EdgeInsets.all(10),
                  child:
                  Container(
                    child:Text(news[index]["Title"],style:TextStyle(fontSize:30,color:Colors.black,fontWeight:FontWeight.bold),),
                  ),
            ),

                SizedBox(
                  height:10,
                  width:double.infinity,
                  child:Divider(color:Colors.red.shade900,thickness:5,),
                ),

                Container(
                  padding:EdgeInsets.all(15),
                  child:Text(news[index]["Content"],style:TextStyle(fontSize:22,color:Colors.black,fontWeight:FontWeight.bold),),
                ),
                Padding(
                  padding:EdgeInsets.all(15),
                  child: Column(
                      children: [
                        Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [
                            Text("Categories : ",style:TextStyle(fontSize:20,color:Colors.black,fontWeight:FontWeight.bold,),),
                            Container(
                              child:Text(news[index]["Categories"],style:TextStyle(fontSize:20,color:Colors.red.shade900,fontWeight:FontWeight.bold),),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [
                            Text("Player ID: ",style:TextStyle(fontSize:20,color:Colors.black,fontWeight:FontWeight.bold,),),
                            Container(
                              child:Text(news[index]["PlayerID"].toString(),style:TextStyle(fontSize:20,color:Colors.red.shade900,fontWeight:FontWeight.bold),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [
                            Text("Team ID: ",style:TextStyle(fontSize:20,color:Colors.black,fontWeight:FontWeight.bold,),),
                            Container(
                              child:Text(news[index]["TeamID"].toString(),style:TextStyle(fontSize:20,color:Colors.red.shade900,fontWeight:FontWeight.bold),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [
                            Text("Updated: ",style:TextStyle(fontSize:20,color:Colors.black,fontWeight:FontWeight.bold,),),
                            Container(
                              child:Text(news[index]["TimeAgo"].toString(),style:TextStyle(fontSize:20,color:Colors.red.shade900,fontWeight:FontWeight.bold),),
                            ),
                          ],
                        ),

                      ]
                  ),
                )],
            );
          },


        ),
      ),
    );
  }
}
