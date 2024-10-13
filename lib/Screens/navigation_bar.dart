import 'package:flutter/material.dart';
import 'package:google_map_all_concept/Constant/colorclass.dart';
import 'package:google_map_all_concept/Constant/font_weight.dart';
import 'package:google_map_all_concept/Screens/convertScreen.dart';
import 'package:google_map_all_concept/Screens/home_screen.dart';
import 'package:google_map_all_concept/Screens/polylinescreen.dart';
import 'package:google_map_all_concept/Screens/scearchscreen.dart';
import 'package:google_map_all_concept/Widgets/container_decoration.dart';
import 'package:google_map_all_concept/Widgets/textwidget.dart';
class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  List<Widget> listOfPages =const [HomeScreen(),Scearchscreen(),Convertscreen(),HomeScreen()];
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
        final height=MediaQuery.of(context).size.height;
     return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding:const  EdgeInsets.symmetric(vertical: 20,horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                     SizedBox(  height: height*0.025),
                     Center(child: TextWidget(text: "GOOGLE MAP", fSize: 30,fWeight: MyFontWeight.bold,)),
                     SizedBox(  height: height*0.07),
                     SizedBox(
                       height: height*0.07,
                       child: InkWell(
                         onTap: (){
                        Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>const  HomeScreen()),
                                    );
                         },
                      child: Container(
                        decoration: containerDecorationWidget(color: MyColors.verify),
                        child: Center(
                          child:TextWidget(text: "current location", fSize: 17,textColor: MyColors.white,)
                        ),
                      ),
                       )
                     ),
        
        
                     SizedBox(  height: height*0.025),
                     SizedBox(
                       height: height*0.07,
                       child: InkWell(
                         onTap: (){
                        Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const Convertscreen()),
                                    );
                         },
                      child: Container(
                        decoration: containerDecorationWidget(color: MyColors.verify),
                        child: Center(
                          child:TextWidget(text: "conver litlng and place", fSize: 17,textColor: MyColors.white,)
                        ),
                      ),
                       )
                     ),
        
        
                     SizedBox(  height: height*0.025),
                     SizedBox(
                       height: height*0.07,
                       child: InkWell(
                         onTap: (){
                        Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const Scearchscreen()),
                                    );
                         },
                      child: Container(
                        decoration: containerDecorationWidget(color: MyColors.verify),
                        child: Center(
                          child:TextWidget(text: "search places", fSize: 17,textColor: MyColors.white,)
                        ),
                      ),
                       )
                     ),

                      SizedBox(  height: height*0.025),
                     SizedBox(
                       height: height*0.07,
                       child: InkWell(
                         onTap: (){
                        Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const Polylinescreen()),
                                    );
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
      )
        );
  }
}