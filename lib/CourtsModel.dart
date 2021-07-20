import 'package:google_maps_flutter/google_maps_flutter.dart';

class Court {
  String CourtName;
  String address;
  String description;
  String thumbnail;
  LatLng locationCoordinates;

  Court(
      {this.CourtName, this.address, this.description, this.thumbnail, this.locationCoordinates});}

final List<Court> CourtOuts = [
  Court(
    CourtName: 'Decathlon',
    address: "Petbasheerabad, Hyderabad",
    description: 'Sports Store with free to play court',
    locationCoordinates: LatLng(17.509980467437472, 78.47837338403025),
  ),
  Court(
    CourtName: "Decathlon",
    address: 'Manjeera Mall, KPHB',
    description: 'Sports Store with free to play court',
    locationCoordinates: LatLng(17.491882228154335, 78.39260631850402),
  ),
  Court(
    CourtName: 'Decathlon',
    address: 'Beside Big Bazar, Uppal',
    description: 'Sports Store with free to play court',
    locationCoordinates: LatLng(17.404828673623115, 78.58456951844913),
  ),
  Court(
    CourtName: 'BasketBall Court',
    address: 'Alwyn Colony,Sanath Nagar',
    description: 'Free to play(With Paid Morning Coaching)',
    locationCoordinates: LatLng(17.457143561298995, 78.44607165300786),
  ),
  Court(
    CourtName: 'YMCA BASKETBALL COURT',
    address: 'SP Rd,Shivaji Nagar,Sec',
    description: 'BasketBall Court',
    locationCoordinates: LatLng(17.44432612310392, 78.49914723323978),
  ),
  Court(
    CourtName: 'Gamepoint 100 Feet',
    address: '100Feet Rd,Madhapur',
    description: 'Membership Based',
    locationCoordinates: LatLng(17.453824601063708, 78.38671197984175),
  ),
  Court(
    CourtName: 'Gamepoint 100 HITEC',
    address: 'Siddhi Vinayak Nagar,Madhapur',
    description: 'Membership Based',
    locationCoordinates: LatLng(17.4567318951135, 78.38522078780127),
  ),
  Court(
    CourtName: 'Gamepoint UPPAL',
    address: 'IDA uppal,Uppal',
    description: 'Membership Based',
    locationCoordinates: LatLng(17.403283599613093, 78.55142067185194),
  ),
  Court(
    CourtName: 'Indoor Stadium',
    address: 'saroornagar, Hyd',
    description: 'INDOOR STADIUM',
    locationCoordinates: LatLng(17.360676816431138, 78.54789923368108),
  ),
  Court(
    CourtName: 'Subba Rao Park',
    address: 'Hafeezpet, Hyderabad',
    description: 'Free To Play Park',
    locationCoordinates: LatLng(17.49624305002165, 78.36302860926047),
  ),
  Court(
    CourtName: 'Keystone Basketball Academ',
    address: 'Puppalguda, Telangana 500032',
    description: 'Coaching',
    locationCoordinates: LatLng(17.41148360764853, 78.34911901270443),
  ),

//Court(
//    CourtName: '',
//    address: '',
//    description: 'Dermatologist',
//    locationCoordinates: LatLng(),
//  ),
];