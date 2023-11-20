import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appbar() {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
    backgroundColor: Color(0xff001B79),
    title: Text(
      'Sevika',
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      Container(
        child: Image.network(
            "https://sevikacustomerprofiles.s3.ap-south-1.amazonaws.com/admin/New-logo.png"),
      )
    ],
  );
}
