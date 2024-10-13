import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_map_all_concept/Constant/colorclass.dart';
import 'package:google_map_all_concept/Widgets/container_decoration.dart';
import 'package:google_map_all_concept/Widgets/inputdecorationwidget.dart';
import 'package:google_map_all_concept/Widgets/textwidget.dart';
class Convertscreen extends StatefulWidget {
 const  Convertscreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ConvertscreenState createState() => _ConvertscreenState();
}

class _ConvertscreenState extends State<Convertscreen> {

  TextEditingController coordinateController =TextEditingController();
   TextEditingController latitudeController =TextEditingController();
   TextEditingController longituteController =TextEditingController();
   String? coordinateAns;
   String? stAddress;

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 TextWidget(text: "Address to Coordinate", fSize: 30),
                 SizedBox(height: height*0.04),
                 TextWidget(text: coordinateAns??"Enter Address", fSize: 15),
                 SizedBox(height: height*0.03),
                     SizedBox(
                      height: height*0.07,
                       child: TextField(
                        controller: coordinateController,
                            decoration: inputDecorationWidget(
                              text: "Enter your Address"
                              )
                       ),
                     ),
        
                      SizedBox(  height: height*0.025),
                     SizedBox(
                       height: height*0.07,
                       child: InkWell(
                         onTap: (){
                          addressToCoordinate();
                         },
                      child: Container(
                        decoration: containerDecorationWidget(color: MyColors.verify),
                        child: Center(
                          child:TextWidget(text: "Coordinate", fSize: 17,textColor: MyColors.white,)
                        ),
                      ),
                       )
                     ),
        
        
                     SizedBox(height: height*0.04),
                 TextWidget(text: stAddress??"Enter Address", fSize: 15),
                     SizedBox(height: height*0.03),
                     SizedBox(
                      height: height*0.07,
                       child: TextField(
                        controller: latitudeController,
                       keyboardType: TextInputType.number,
                            decoration: inputDecorationWidget(
                              text: "Enter latitude"
                              )
                       ),
                     ),
        
                     SizedBox(height: height*0.03),
                     SizedBox(
                      height: height*0.07,
                       child: TextField(
                        controller: longituteController,
                        keyboardType: TextInputType.number,
                            decoration: inputDecorationWidget(
                              text: "Enter longitude"
                              )
                       ),
                     ),
        
                      SizedBox(  height: height*0.025),
                     SizedBox(
                       height: height*0.07,
                       child: InkWell(
                         onTap: (){
                          ltiLongi();
                         },
                      child: Container(
                        decoration: containerDecorationWidget(color: MyColors.verify),
                        child: Center(
                          child: TextWidget(text: "get detail", fSize: 17,textColor: MyColors.white,)
                        ),
                      ),
                       )
                     ),
              ],
            ),
          ),
          ),
      )
    );
  }




  Future<void> addressToCoordinate()async{

    try{
         if(coordinateController.text.isNotEmpty){
             final address = coordinateController.value.toString();
             List<Location> locations = await locationFromAddress(address);

             setState(() {
               coordinateAns = "${locations.last.latitude} ${locations.last.longitude}";
               
             });
             
            }
    }catch(e){
            print(e);
    }
  }

  Future<void> ltiLongi()async{

    try{
         if(longituteController.text.isNotEmpty && latitudeController.text.isNotEmpty){
            double latitude = double.parse(latitudeController.text);
            double longitude = double.parse(longituteController.text);
             List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

             setState(() {
               stAddress ="${placemarks.reversed.last.country}" ;
             });
             
            }
    }catch(e){
            print(e);
    }
  }
}