import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../CourtsModel.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  GoogleMapController _controller;

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;

  @override
  void initState() {
    super.initState();
    CourtOuts.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.CourtName),
          draggable: false,
          infoWindow:
          InfoWindow(title: element.CourtName, snippet: element.address),
          position: element.locationCoordinates));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _courtsList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: () {
            // moveCamera();
          },
          child: Stack(children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    height: 125.0,
                    width: 275.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                        child: Row(children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image: AssetImage('assets/courts.jpg'),
                                      fit: BoxFit.cover))),
                          SizedBox(width: 10.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  CourtOuts[index].CourtName,
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  CourtOuts[index].address,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    CourtOuts[index].description,
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ])
                        ]))))
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                  ),
                ),
                height: 50.0,
                child: Text(
                  'BB Courts',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 186,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(17.3850, 78.4867), zoom: 12.0),
                    markers: Set.from(allMarkers),
                    onMapCreated: mapCreated,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  child: Container(
                    height: 100.0,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: CourtOuts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _courtsList(index);
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: CourtOuts[_pageController.page.toInt()].locationCoordinates,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
}