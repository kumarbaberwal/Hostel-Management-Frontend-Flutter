import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piethostel/common/constants.dart';
import 'package:piethostel/common/custom_text_field.dart';
import 'package:piethostel/common/spacing.dart';
import 'package:piethostel/features/auth/screens/register_screen.dart';
import 'package:piethostel/features/auth/widgets/custom_button.dart';
import 'package:piethostel/features/home/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: 250.h,
                      width: double.infinity,
                      child: FittedBox(
                        child: Image.asset(
                          AppConstants.logo,
                          height: 120.h,
                        ),
                      ),
                    ),
                  ),
                  heightSpacer(30),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Login to your Account',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  heightSpacer(25),
                  const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  heightSpacer(15),
                  CustomTextField(
                    controller: email,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Colors.grey)),
                    inputHint: "Enter your Email",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      } else if (!value.contains("@")) {
                        return "Email is Not Valid";
                      } else {
                        return null;
                      }
                    },
                  ),
                  heightSpacer(30),
                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  heightSpacer(15),
                  CustomTextField(
                    controller: password,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Colors.grey)),
                    inputHint: "Enter your password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  heightSpacer(30),
                  CustomButton(
                      buttonText: 'Login',
                      buttonColor: Colors.white,
                      onTap: () {
                        // if (_formkey.currentState!.validate()) {
                        //   log('Validation');
                        // } else {
                        //   log("validation Failed");
                        // }
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const HomeScreen(),
                            ));
                      },
                      size: 16),
                  heightSpacer(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't have an account? "),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 14.sp,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
