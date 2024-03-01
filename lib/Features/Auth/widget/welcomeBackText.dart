import 'package:fitplus/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallette.backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            Text(
              'Welcome to MED GUARD!',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Pallette.fontColor,
              ),
            ),
            Text(
              'As a new user, kindly fill in your valid hospital ',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Pallette.fontColor,
              ),
            ),
            Text(
              'number to ensure a personalized and secure',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Pallette.fontColor,
              ),
            ),
            Text(
              'experience. Your health journey starts here',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Pallette.fontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
