import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_map_all_concept/Widgets/inputdecorationwidget.dart';
import 'package:google_map_all_concept/Widgets/textwidget.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class Scearchscreen extends StatefulWidget {
 const  Scearchscreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScearchscreenState createState() => _ScearchscreenState();
}

class _ScearchscreenState extends State<Scearchscreen> {

final TextEditingController _controller=TextEditingController();
var uuid=Uuid();
String _sessionToken= "112233";
List<dynamic> _placeList =[];

@override
void initState(){
super.initState();

_controller.addListener((){
     //onchange method check and provide device uuid
     onChange();
     
});
}

  @override
  Widget build(BuildContext context) {
 final height=MediaQuery.of(context).size.height;
  final width=MediaQuery.of(context).size.width;
    return SafeArea(
       child: Scaffold(
         body: Padding(
          padding:const EdgeInsets.symmetric(vertical: 18,horizontal: 14 ),
          child: Column(
            children: [
              SizedBox(
                width: width,
                height: height*0.06,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.streetAddress,
                  textInputAction:TextInputAction.search ,
                  decoration: inputDecorationWidget(
                    text: "Search",
                    onSearchPressed:(){}
                    ),
                   onSubmitted: (value) {
                },
                  ),
                  
                ),
         
         
         
                SizedBox(height: height*0.07,),
         
                TextWidget(text: "billing method no complete", fSize: 30)
              
            ],
          ),
          ),
       ),
    );
  }


  void onChange(){
    if(_sessionToken.isEmpty){
         setState(() {
           _sessionToken=uuid.v4();
         });
    }
    getSuggesstion(_controller.text);
  }

  void getSuggesstion(String input)async{
     String _kPLACES_API_KEY="AIzaSyAT9Dj3wrnjsNYjGoksQkDzedPI-zOacbg";
     String baseURL ='https://maps.googleapis.com/maps/api/place/autocomplete/json';
     String request = '$baseURL?input=$input&key=$_kPLACES_API_KEY&sessiontoken=$_sessionToken';
   
     Uri uri=Uri.parse(request);
     var response=await http.get(uri);
     print(response.body.toString());
     if(response.statusCode==200){
     setState(() {
     _placeList=jsonDecode(response.body.toLowerCase())['predictions'];
    // print("byyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy${_placeList[0]['discribtion']}");
     });
     }
     else{
    throw Exception("fail to retrive data");
     }
  }
}