import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/utils/colors_const.dart';

class CustomInputField extends StatelessWidget {
  String? hintTex;

  ///ghjkl;;;
  IconData? prefixIcon; //ghjkl
  IconData? suffixIcon; //fghjkl

  CustomInputField({this.hintTex, this.prefixIcon, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: ColorConstants.GREYSHDE4,
          hintText: hintTex,
          hintStyle: GoogleFonts.montserrat(
              color: ColorConstants.GREYSHDE5,
              fontWeight: FontWeight.w600,
              fontSize: 12),
          prefixIcon:
              prefixIcon != null ? Icon(prefixIcon) : null, // lkashodiasdoh
          suffixIcon: Icon(suffixIcon),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConstants.GREYSHDE1))),
    );
  }
}
