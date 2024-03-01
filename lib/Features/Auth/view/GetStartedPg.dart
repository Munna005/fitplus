import 'package:fitplus/pallete.dart';
import 'package:fitplus/utilities%20/Widgets/GeneralBtn.dart';
import 'package:fitplus/utilities%20/Widgets/INPUTFORM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../repo/auth_repository.dart';

class HospitalNumValidation extends ConsumerStatefulWidget {
  static const routeName = '/hospitalNumValidation';

  const HospitalNumValidation({
    super.key,
  });

  @override
  ConsumerState<HospitalNumValidation> createState() =>
      _HospitalNumValidationState();
}

class _HospitalNumValidationState extends ConsumerState<HospitalNumValidation> {
  late PageController pageController;
  final controller = TextEditingController();
  double progress = 0;
  final String api = '/patient';

  @override
  void initState() {
    pageController = PageController()
      ..addListener(() {
        setState(() {
          progress = pageController.page ?? 0;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallette.backgroundColor,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 35,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
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
              SizedBox(
                height: size.height * 0.06,
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              width: double.infinity,
              child: Column(children: [
                SizedBox(
                  height: size.height * .1,
                ),
                TextInputForm(
                  controller: controller,
                  text: 'Enter Hospital Number',
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Number?',
                        style: TextStyle(color: Pallette.backgroundColor),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                GeneralBtn(
                  text: 'Continue',
                  onTap: () {
                     AuthService()
                        .validateHospitalNumber(api, controller.text, context, '/passwordPage')
                        .catchError((err) {});
                  },
                  // onTap: () {
                  //   Navigator.of(context).pushNamed('/passwordPage');
                  // },
                ),
                SizedBox(
                  height: size.height * .009,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/loginpage');
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(color: Pallette.backgroundColor),
                        ))
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
