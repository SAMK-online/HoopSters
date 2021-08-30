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
    bool _loading;
    /*List score;*/
 
    Future fetchNews()async{
      http.Response response;
      response = await http.get(Uri.parse("https://api.sportsdata.io/v3/nba/scores/json/News?key=74019eae9e404d2e9b9e5b707922b7f9"));
      setState(() {
        _loading = false;
        if (response.statusCode==200){
          news = json.decode(response.body);
        }
      });
    }
 
    @override
    void initState() {
      fetchNews();
      _loading = true;
      super.initState();
    }
 
    @override
    Widget build(BuildContext context) {
      return  MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: _loading
              ? Center(
            child: CircularProgressIndicator(),
          )
             :ListView.builder(
          shrinkWrap:true,
          itemCount:news.length,
          itemBuilder: (context,index){
            return Column(
              children: [
                Padding(
                  padding:EdgeInsets.all(10),
                  child:
                  Container(
                     decoration: BoxDecoration(
                       color: Colors.amber[50],
                       boxShadow: [
                         BoxShadow(
                         color: Colors.grey.withOpacity(0.5),
                             spreadRadius: 5,
                             blurRadius: 7,
                             offset: Offset(0,9))],
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(
                         color: Colors.black,
                         width: 3
                       ),
                     ),
                     child:Text(news[index]["Title"],style:TextStyle(fontSize:30,color:Colors.black,fontWeight:FontWeight.bold),),
                   ),
             ),

                SizedBox(
                  height:10,
                  width:double.infinity,
                  child:Divider(color:Colors.red.shade900,thickness:5,),
                ),

            Container(
                   decoration: BoxDecoration(
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                         color: Colors.grey.withOpacity(0.5),
                         spreadRadius: 5,
                         blurRadius: 7,
                         offset: Offset(0,9),
                       )
                     ],
                     borderRadius: BorderRadius.circular(15),
                     border: Border.all(
                         color: Colors.black,
                         width: 3
                     ),
                   ),
                   padding:EdgeInsets.all(15),
                   child:Text(news[index]["Content"],style:TextStyle(fontSize:22,color:Colors.black,fontWeight:FontWeight.bold,),),
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
