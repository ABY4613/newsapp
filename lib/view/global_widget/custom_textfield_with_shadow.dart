// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/utils/colors_const.dart';

class CustomTextFieldWithShadow extends StatelessWidget {
  const CustomTextFieldWithShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 9,
            color: ColorConstants.BLACK.withOpacity(.1))
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: Icon(
              Icons.mic_none,
              color: ColorConstants.GREYSHDE6,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: ColorConstants.GREYSHDE6,
            ),
            hintText: "Search any Product..",
            hintStyle: GoogleFonts.montserrat(
                fontSize: 14, color: ColorConstants.GREYSHDE6)),
      ),
    );
  }
}
