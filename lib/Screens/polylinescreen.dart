import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_map_all_concept/Constant/colorclass.dart';
import 'package:google_map_all_concept/Constant/font_weight.dart';
import 'package:google_map_all_concept/Widgets/container_decoration.dart';
import 'package:google_map_all_concept/Widgets/textwidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Polylinescreen extends StatefulWidget {
  const Polylinescreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PolylinescreenState createState() => _PolylinescreenState();
}

class _PolylinescreenState extends State<Polylinescreen> {

Completer<GoogleMapController> mapContoller=Completer(); 
//  PolylinePoints polylinePoints = PolylinePoints();

//   List<LatLng> polylineCoordinates = [];
//   Polyline? _polyLines;

 static const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(31.606319, 74.414212 ),
    zoom: 14
  );

//   final List<Marker> _marker=[
//    const  Marker(
//       markerId: MarkerId("source"),
//       position: LatLng(31.606319, 74.414212),
//       icon: BitmapDescriptor.defaultMarker
//     ),
//    const  Marker(
//       markerId: MarkerId("source"),
//       position: LatLng(31.585144, 74.385564),
//       icon: BitmapDescriptor.defaultMarker
//     )
//   ];

//   static const LatLng sourceAddress= LatLng(31.606319, 74.414212);
//   static const LatLng destinationAddress= LatLng(31.585144, 74.385564);

  List<LatLng>  polyLatLng=[
   const LatLng(31.606319, 74.414212),
    const LatLng(31.585144, 74.385564)
  ];
  Set<Marker>  _markers={};
  Set<Polyline> _polyLines={};


  void h(){
    for(int i=0;i<polyLatLng.length;i++){
      _markers.add(
            Marker(
              markerId:MarkerId( i.toString()),
              position: polyLatLng[i],
              icon: BitmapDescriptor.defaultMarker
            )
      );

      setState(() {
        _polyLines.add(
          Polyline(
            polylineId: PolylineId("id"),
            points: polyLatLng,
            color: MyColors.blue,
            width: 4

          )
        );
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
     final height=MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height*0.05,),
              TextWidget(text: "PolyLine", fSize: 30,fWeight: MyFontWeight.extra,),
              SizedBox(height: height*0.03,),
              SizedBox(
                height: height*0.4,
                child: GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  markers: Set<Marker>.of(_markers),
                 polylines:_polyLines,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller){
                             mapContoller.complete(controller);
                  },
                  ),
              ),

               SizedBox(  height: height*0.025),
                     SizedBox(
                       height: height*0.07,
                       child: InkWell(
                         onTap: (){
                     //  getPolyPoints();
                     h();
                         },
                      child: Container(
                        decoration: containerDecorationWidget(color: MyColors.verify),
                        child: Center(
                          child:TextWidget(text: "polyLine", fSize: 17,textColor: MyColors.white,)
                        ),
                      ),
                       )
                     ),
             
            ],
          ),
        ),
      ),
    );
 
  }


//   void getPolyPoints() async {
//   try{
// PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//         googleApiKey: "AIzaSyAT9Dj3wrnjsNYjGoksQkDzedPI-zOacbg",
//         request: PolylineRequest(
//         origin: PointLatLng(sourceAddress.latitude, sourceAddress.longitude),
//         destination: PointLatLng(destinationAddress.latitude, destinationAddress.longitude),
//         mode: TravelMode.driving,
//         ),
// );

//   if (result.points.isNotEmpty) {
//     result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });

//    Polyline _polyLines= Polyline(
//       polylineId: PolylineId("sts"),
//       points: polylineCoordinates,
//       color: MyColors.blue,
//       width: 10
//       )  ;
//     } else {
//       print("No points found. Status: ${result.status}");
//     }

  
  
//   } catch (e) {
//     print("Error fetching polyline points: $e");
//   }

// }
}