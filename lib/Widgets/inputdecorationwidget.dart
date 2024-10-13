import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_map_all_concept/Constant/colorclass.dart';

InputDecoration inputDecorationWidget({
  required String text,
  Icon? preIcon,
  Icon? sufIcon,
  VoidCallback? onSearchPressed,
}) {
  return InputDecoration(
    hintText: text,
    border: borderWidget(),
    enabledBorder: borderWidget(),
    focusedBorder: borderWidget(),
    hintStyle: GoogleFonts.poppins(
      fontSize: 15,
      color: MyColors.hintInput,
    ),
    prefixIcon: preIcon,
    suffixIcon: IconButton(
      icon: const Icon(Icons.search),
      onPressed: onSearchPressed, // Perform task when search icon is pressed
    ),
  );
}

OutlineInputBorder borderWidget() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide:const  BorderSide(color: Colors.grey),
  );
}


