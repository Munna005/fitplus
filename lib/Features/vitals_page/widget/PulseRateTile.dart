import 'package:fitplus/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PulseRateTile extends StatefulWidget {
  const PulseRateTile({super.key});

  @override
  State<PulseRateTile> createState() => _PulseRateTileState();
}

class _PulseRateTileState extends State<PulseRateTile> {
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
                'Pulse Rate',
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Pallette.TextColor3),
              ),
              Text(
                '800 BPM',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Pallette.backgroundColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
