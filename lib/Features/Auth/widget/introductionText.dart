import 'package:fitplus/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallette.backgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text(
              'Welcome Back Victor!!',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Pallette.fontColor,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Lets get you back in ',
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
