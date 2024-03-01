import 'package:fitplus/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BloodPressureTile extends StatefulWidget {
  const BloodPressureTile({super.key});

  @override
  State<BloodPressureTile> createState() => _BloodPressureTileState();
}

class _BloodPressureTileState extends State<BloodPressureTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Pallette.borderColor)),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Blood Pressure',
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Pallette.TextColor3),
              ),
              Text(
                '59/200 CAL',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Pallette.backgroundColor),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Steps',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Pallette.TextColor3),
              ),
              Text(
                '2232',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Pallette.TextColor2),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Distance',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Pallette.TextColor3),
              ),
              Text(
                '0.88 KM',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Pallette.TextColor2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
