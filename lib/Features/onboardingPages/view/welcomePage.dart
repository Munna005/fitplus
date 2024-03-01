import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitplus/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Auth/widget/ContinueBtn.dart';
import '../../Auth/widget/getStartedBtn.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
    'assets/image4.png',
    'assets/image5.png',
    'assets/image6.png',
    'assets/image7.png',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallette.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            items: [
              'assets/image1.png',
              'assets/image2.png',
              'assets/image3.png',
              'assets/image4.png',
              'assets/image5.png',
              'assets/image6.png',
              'assets/image7.png',
            ].map((e) {
              return Builder(builder: (BuildContext) {
                return SizedBox(
                  width: double.infinity,
                  //child: Text('text $e'),
                  child: Image.asset(e),
                );
              });
            }).toList(),
            options: CarouselOptions(
              height: size.height * 0.44,
              autoPlay: true,
              viewportFraction: 0.95,
              enableInfiniteScroll: true,
              autoPlayCurve: Easing.linear,
              autoPlayInterval: const Duration(seconds: 5),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          SizedBox(
            child: Text(
              'Welcome!',
              style: GoogleFonts.inknutAntiqua(
                  fontSize: 24,
                  color: Pallette.fontColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            padding: EdgeInsets.zero,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                  child: Column(
                children: [
                  Text(
                    'Welcome to Hospital App,',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                      color: Pallette.fontColor,
                    ),
                  ),
                  Text('your all-in-one solution for personalized health',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Pallette.fontColor,
                      )),
                  Text('management. Access medical records, schedule',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Pallette.fontColor,
                      )),
                  Text('appointments, and connect with your care team',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Pallette.fontColor,
                      )),
                  Text('seamlessly. Your well-being, simplified.',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Pallette.fontColor,
                      ))
                ],
              )),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          const GetStartedBtn(),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.43,
                child: const Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 1,
                ),
              ),
              Text(
                '   Or   ',
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Container(
                width: size.width * 0.43,
                child: const Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 1,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          const ContinueBtn(),
        ],
      ),
    );
  }
}
