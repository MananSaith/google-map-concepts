import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_all_concept/Constant/colorclass.dart';
import 'package:google_map_all_concept/Constant/font_weight.dart';
import 'package:google_map_all_concept/Widgets/container_decoration.dart';
import 'package:google_map_all_concept/Widgets/textwidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

Completer<GoogleMapController> mapContoller=Completer(); 


String? currentLcation;



  static const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(31.003344,74.714944 ),
    zoom: 14
  );
 
  List<Marker> _marker =[];
  final List<Marker> _list =const[
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(31.003344,74.714944 ),
        infoWindow: InfoWindow(
          title: "my location",
        ),
        
        ),

      
        //you can add more markers
  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
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
              TextWidget(text: "Google Map", fSize: 30,fWeight: MyFontWeight.extra,),
              SizedBox(height: height*0.03,),
              SizedBox(
                height: height*0.4,
                child: GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  markers: Set<Marker>.of(_marker),
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller){
                             mapContoller.complete(controller);
                  },
                  ),
              ),
              SizedBox(height: height*0.03,),
              TextWidget(text: currentLcation??"your current location display here", fSize: 14,fWeight: MyFontWeight.medium,),
              SizedBox(height: height*0.025),
              SizedBox(
                     height: height*0.07,
                     child: InkWell(
                       onTap: (){
                        getCurrentLocation();
                       },
                    child: Container(
                      decoration: containerDecorationWidget(color: MyColors.verify),
                      child: Center(
                        child: TextWidget(text: "Get", fSize: 17,textColor: MyColors.white,)
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

  Future<void> getCurrentLocation() async{
    try{
      // it take user permission
      await Geolocator.requestPermission().then((v){
      });

      final infoCurrentPosition = await Geolocator.getCurrentPosition();

      final lati = infoCurrentPosition.latitude;
      final longitute =infoCurrentPosition.longitude;

      List<Placemark> placemarks = await placemarkFromCoordinates(lati, longitute);

     _marker.add(
        Marker(
        markerId: MarkerId("2"),
        position: LatLng(lati,longitute ),
        infoWindow: InfoWindow(
          title: "my currentr location",
        ),
        
        ),


     );
      currentLcation =""
               "${placemarks.reversed.last.administrativeArea}"
               " ${placemarks.reversed.last.subAdministrativeArea} "
               "${placemarks.reversed.last.subLocality}" 
               " ${placemarks.reversed.last.country}";

      // instants of google map
      final GoogleMapController mapController= await mapContoller.future;
      // create new camera
      CameraPosition newCameraPosition =  CameraPosition(
                       target: LatLng(lati,longitute ),
                      zoom: 14
                      );
      // update camera possition
      mapController.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));

      setState(() {
             }); 



    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text("Error\n$e"),
                  duration: const Duration(seconds: 2),
                ),
              );
    }
  }
}