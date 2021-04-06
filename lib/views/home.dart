import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hoop_talk/helper/news.dart';
import 'package:flutter_hoop_talk/model/article_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  var newslist;

  void getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    newslist = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void intitState(){
    super.initState();
    getNews();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Text("Hoop", style: TextStyle(color: Colors.black),),
            Text("Sters",  style: TextStyle(
                color: Colors.orangeAccent
            ),
            ),
          ],
        ),
        elevation:0.0 ,
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.search),
            onPressed: (){},
          )
    ],
      ),
      body: SafeArea(
        child: _loading ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            ):
        SingleChildScrollView(
        child: Container(
          color: Colors.white38,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(

            children: <Widget>[
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.blueGrey,
                  border: Border.all(
                    color: Colors.red[500],
                  ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                padding: const EdgeInsets.only(left:150,top:16,right:150,bottom: 16,),
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                    Icon(FontAwesomeIcons.basketballBall,
                    color: Colors.orangeAccent),
                      const SizedBox(height: 10),
                  Text("  What's Ballin?  ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  ),
                  ],
              ),
              ),
              ///Articles

              Container(
                padding: EdgeInsets.only(top:16),
                child:ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return BlogTile(
                          imgUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          desc: articles[index].description);
                    }
                    ),
              )
            ],
          ),
        ),
      ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          color: Colors.blueGrey,
          backgroundColor:Colors.white38,
          buttonBackgroundColor: Colors.black,
          height: 70,
          items: <Widget>[
            Icon(Icons.sports_basketball_sharp, size: 40, color: Colors.deepOrangeAccent),
            Icon(Icons.table_view_outlined, size: 40, color: Colors.orangeAccent),
            Icon(Icons.assistant_navigation, size: 40, color: Colors.deepOrangeAccent),
            Icon(Icons.person, size: 40, color: Colors.orangeAccent),
            Icon(Icons.format_line_spacing_outlined, size: 40, color: Colors.deepOrangeAccent),
          ],
          animationDuration: Duration(
            microseconds: 500,
          ),
          animationCurve: Curves.bounceInOut,
          onTap: (index) {
            debugPrint("Current Index is $index");
          }
      ),
    );
  }
}
class BlogTile extends StatelessWidget {
final String imgUrl, title, desc;
  BlogTile({@required this.imgUrl, @required this.title, @required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(imgUrl),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}

class CatagoryTile extends StatelessWidget {

   final imageUrl, CatagoryName;
   CatagoryTile({this.imageUrl, this.CatagoryName});

   @override
   Widget build(BuildContext context) {
     return Container(
       child: Stack(
         children: <Widget>[
           Image.network(imageUrl, width: 120, height: 60,),
         ],
       ),
     );
  }
 }


