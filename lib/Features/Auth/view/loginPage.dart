import 'package:fitplus/Features/Auth/repo/auth_repository.dart';
import 'package:fitplus/pallete.dart';
import 'package:fitplus/utilities%20/Widgets/GeneralBtn.dart';
import 'package:fitplus/utilities%20/Widgets/INPUTFORM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class LoginPage extends ConsumerStatefulWidget {
  static const routeName = '/loginpage';

  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool checkboxValue = false;
  final String api = '/patient';

  TextEditingController hospitalNumber = TextEditingController();
  final password = TextEditingController();

  var myBox = Hive.box('myBox');

  // validateHospitalNumber(String api, String hospitalNumber) {
  //   var response = ref
  //       .read(authRepoController)
  //       .validateHospitalNumber(api, hospitalNumber, context)
  //       .catchError(
  //     (err) {
  //       debugPrint(err);
  //     },
  //   );

  //   final users = patientFromJson(response.toString());
  //   debugPrint(users.toString());
  // }

  @override
  Widget build(BuildContext context) {
    // String number = hospitalNumber.text.toString();
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
              SizedBox(
                height: size.height * 0.06,
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    height: size.height * .623,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * .07,
                        ),
                        // const TextInputForm(

                        //   text: 'Hospital Number',
                        // ),
                        TextFormField(
                          controller: hospitalNumber,
                          // onChanged: (value) {
                          //   setState(() {
                          //     number = value.toString();
                          //   });
                          // },
                          decoration: InputDecoration(
                            labelText: 'hospital Number',
                            labelStyle: const TextStyle(
                                color: Pallette.backgroundColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Pallette.backgroundColor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Pallette.backgroundColor),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        TextInputForm(
                          controller: password,
                          text: 'Password',
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                    'Remeber Me',
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Pallette.TextColor),
                                  ),
                                ],
                              ),
                              const Text(
                                'Forgot Number?',
                                style:
                                    TextStyle(color: Pallette.backgroundColor),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        GeneralBtn(
                          text: 'Login',
                          onTap: () {
                            var savedPassword = myBox.get('password'.length);
                            if (password.text == savedPassword) {
                              AuthService()
                                  .validateHospitalNumber(
                                      api,
                                      hospitalNumber.text,
                                      context,
                                      '/bottomBar')
                                  .catchError(
                                    (err) {},
                                  );
                            } else {
                              debugPrint('wrong password');
                            }
                          },
                        ),
                        SizedBox(
                          height: size.height * .009,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Dont have an account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/hospitalNumValidation');
                              },
                              child: const Text(
                                'Register',
                                style:
                                    TextStyle(color: Pallette.backgroundColor),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
