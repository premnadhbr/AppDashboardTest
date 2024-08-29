import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpgradeButton extends StatelessWidget {
  const UpgradeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.height,
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
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/6701409-removebg-preview.png',
              height: 50,
              width: 35,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upgrade to PRO",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "No ads and best image quality",
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.w700, // Make the text bold
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xff466cff), Color(0xffa22bff)],
                  stops: [0.25, 0.75],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffa22bff).withOpacity(0.5),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Container(
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle, // Inner circle
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "GO",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, // Make the text bold
                        fontSize: 18,
                        color: const Color(0xffa22bff),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
