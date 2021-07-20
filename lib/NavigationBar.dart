import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hoop_talk/Schedule.dart';
import 'package:flutter_hoop_talk/faqs.dart';
import 'package:flutter_hoop_talk/views/Locations.dart';
import 'package:flutter_hoop_talk/views/home.dart';
import 'package:flutter_hoop_talk/Standing.dart';
import 'package:flutter_hoop_talk/Players.data.dart';
int _selectindex=0;
TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

List<Widget> _page = <Widget>[
  MyHomePage(),
  SchedulePage(),
  StandingsPage(),
  PlayersPage(),
  FaqsPage(),
  MapsPage(),


];

class NavBar extends StatefulWidget{
  @override
  _NavBarState createState()=> _NavBarState();
}

class _NavBarState extends State<NavBar>{
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Hoop", style: TextStyle(color: Colors.deepOrangeAccent),),
                Text("Sters", style: TextStyle(
                    color: Colors.orangeAccent
                ),
                ),
              ],
            ),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
          ),
         body: _page.elementAt(_selectindex),
         bottomNavigationBar: CurvedNavigationBar(
            color: Colors.deepPurple,
            backgroundColor:Colors.orange,
            buttonBackgroundColor: Colors.deepPurple,
            height: 70,
            items: <Widget>[
              Icon(Icons.sports_basketball_sharp, size: 40, color: Colors.black),
              Icon(Icons.table_view_outlined, size: 40, color: Colors.black),
              Icon(Icons.person, size: 40, color: Colors.black),
              Icon(Icons.arrow_circle_down_outlined, size: 40, color: Colors.black),
              Icon(Icons.new_releases_outlined, size: 40, color: Colors.black),
              Icon(Icons.assistant_navigation, size: 40, color: Colors.black),
            ],
            animationDuration: Duration(
              microseconds: 500,
            ),
            animationCurve: Curves.easeInOutBack,
            onTap: (index) {
              setState(() {
                _selectindex = index;
              });
            }),
    )
    );
  }
}

