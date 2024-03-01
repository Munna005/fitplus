import 'package:fitplus/pallete.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyInformationTile extends StatefulWidget {
  const BodyInformationTile({super.key});

  @override
  State<BodyInformationTile> createState() => _BodyInformationTileState();
}

class _BodyInformationTileState extends State<BodyInformationTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Pallette.borderColor)),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Weight',
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Pallette.TextColor3),
              ),
              Text(
                '0',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Pallette.backgroundColor),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Height',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Pallette.TextColor3),
              ),
              Text(
                '0',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Pallette.TextColor2),
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                FluentSystemIcons.ic_fluent_add_circle_filled,
                size: 70,
                color: Pallette.backgroundColor,
              ))
        ],
      ),
    );
  }
}
