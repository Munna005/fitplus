import 'package:fitplus/pallete.dart';
import 'package:fitplus/utilities%20/Widgets/GeneralBtn.dart';
import 'package:fitplus/utilities%20/Widgets/INPUTFORM.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../../utilities /Widgets/bottomNavBar.dart';

class PasswordScreen extends StatefulWidget {
  static const routeName = '/passwordPage';

  const PasswordScreen({
    super.key,
  });

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool checkboxValue = false;
  var myBox = Hive.box('myBox');
  void storePassword() async {
    if (password.text == confirmPassword.text) {
      myBox.put('password', password.text);
      debugPrint(myBox.get('password'));
      // Navigator.of(context).pushNamed('/bottomBar');
      Navigator.pushNamedAndRemoveUntil(
          context, MyButtomBar.routeName, (route) => false);
    }
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
            ],
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.018,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Create Password',
                                style: GoogleFonts.inter(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Create a strong password to secure personal',
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Pallette.TextColor),
                              ),
                              Text(
                                'data about your health',
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Pallette.TextColor),
                              ),
                              SizedBox(
                                height: size.height * .05,
                              ),
                              TextInputForm(
                                controller: password,
                                text: 'Create password',
                              ),
                              SizedBox(
                                height: size.height * .04,
                              ),
                              TextInputForm(
                                controller: confirmPassword,
                                text: 'Confirm password',
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor:
                                  const Color.fromARGB(255, 68, 68, 68),
                              value: checkboxValue,
                              onChanged: (value) {
                                setState(() {
                                  checkboxValue = value!;
                                });
                              },
                            ),
                            Text(
                              'I agree to MedGuard',
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Pallette.TextColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text('Terms of Service',
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: Pallette.TextColor,
                                    fontWeight: FontWeight.w400)),
                            Text('and',
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: Pallette.TextColor,
                                    fontWeight: FontWeight.w400)),
                            Text('Privacy Policy',
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: Pallette.TextColor,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        GeneralBtn(
                          text: 'Continue',
                          onTap: storePassword,
                        ),
                        SizedBox(
                          height: size.height * .04,
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
                                  style: TextStyle(
                                      color: Pallette.backgroundColor),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
