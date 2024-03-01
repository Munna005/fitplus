import 'package:fitplus/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContinueBtn extends StatelessWidget {
  const ContinueBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/loginpage');
      },
      child: Container(
        height: size.height * 0.06,
        width: size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Pallette.ContinueBtnColor),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Continue',
            style: GoogleFonts.inter(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
