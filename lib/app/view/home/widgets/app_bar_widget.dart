import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Row(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/929093-200-removebg-preview.png',
              color: Colors.white,
              height: 30,
              width: 30,
            ),
          ],
        ),
        const SizedBox(width: 5),
        Text(
          "Avatarro",
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 28,
          ),
        ),
      ],
    ),
    actions: [
      Container(
        height: 40,
        width: 90,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xff466cff), Color(0xffa22bff)],
            stops: [0.25, 0.75],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffa22bff).withOpacity(0.6),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "PRO",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}
