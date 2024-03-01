import 'package:fitplus/pallete.dart';
import 'package:fitplus/Features/vitals_page/widget/BloodPressureTile.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../widget/BodyInformationTile.dart';
import '../widget/MovementTile.dart';
import '../widget/PulseRateTile.dart';

class VitalsPage extends StatefulWidget {
  static const routeName = '/vitalsPage';
  const VitalsPage({super.key});

  @override
  State<VitalsPage> createState() => _VitalsPageState();
}

class _VitalsPageState extends State<VitalsPage> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    final day = DateFormat.d().format(today);
    final month = DateFormat.MMMM().format(today);
    final year = DateFormat.y().format(today);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FluentSystemIcons.ic_fluent_person_filled,
                    color: Pallette.backgroundColor,
                    size: 40,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Summary',
                      style: GoogleFonts.inter(
                          fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '$day $month $year',
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Pallette.TextColor,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Activity',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Pallette.TextColor2),
                  ),
                ),
                const MovementTile(),
                const BloodPressureTile(),
                const PulseRateTile(),
                const BodyInformationTile()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
