import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piethostel/common/constants.dart';
import 'package:piethostel/common/custom_text_field.dart';
import 'package:piethostel/common/spacing.dart';
import 'package:piethostel/features/auth/widgets/custom_button.dart';
import 'package:piethostel/features/home/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();

  final emailRegex = RegExp(r'^[\w-]+(.[\w-]+)@[\w-]+(.[\w-]+)(.[a-z]{2,})$');

  String? selectBlock;
  String? selectRoom;

  List<String> blockOptions = ["A", "B"];
  List<String> roomOptionsA = ["101", "102", "103"];
  List<String> roomOptionsB = ["201", "202", "203"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpacer(40),
                Center(
                  child: Image.asset(
                    AppConstants.logo,
                    height: 170.h,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                heightSpacer(30),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Register your Account",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                heightSpacer(25),
                const Text(
                  "Username",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                CustomTextField(
                  controller: username,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  inputHint: "Enter your Username",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username is required";
                    } else {
                      return null;
                    }
                  },
                ),
                heightSpacer(15),
                const Text(
                  "First Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                CustomTextField(
                  controller: firstName,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  inputHint: "Enter your First Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "First Name is required";
                    } else {
                      return null;
                    }
                  },
                ),
                heightSpacer(15),
                const Text(
                  "Last Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                CustomTextField(
                  controller: lastName,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  inputHint: "Enter your Last Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Last Name is required";
                    } else {
                      return null;
                    }
                  },
                ),
                heightSpacer(15),
                const Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                CustomTextField(
                  controller: email,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  inputHint: "Enter your Email",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email is required";
                    } else if (!emailRegex.hasMatch(value)) {
                      return "Invalid Email Address";
                    } else {
                      return null;
                    }
                  },
                ),
                heightSpacer(15),
                const Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                CustomTextField(
                  controller: password,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  inputHint: "Enter your password",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    } else {
                      return null;
                    }
                  },
                ),
                heightSpacer(15),
                const Text(
                  "Phone Number",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                CustomTextField(
                  controller: phone,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  inputHint: "Enter your phone number",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Phone Number is required";
                    } else {
                      return null;
                    }
                  },
                ),
                heightSpacer(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: const BorderSide(
                            width: 1,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          widthSpacer(20),
                          const Text("Block No."),
                          widthSpacer(8),
                          DropdownButton(
                            underline: const SizedBox(),
                            value: selectBlock,
                            onChanged: (String? newValue) {
                              setState(
                                () {
                                  selectBlock = newValue;
                                  selectRoom = null;
                                },
                              );
                            },
                            items: blockOptions.map((String block) {
                              return DropdownMenuItem(
                                value: block,
                                child: Text(block),
                              );
                            }).toList(),
                          ),
                          widthSpacer(20),
                        ],
                      ),
                    ),
                    Container(
                      height: 50.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: const BorderSide(width: 1, color: Colors.green),
                        ),
                      ),
                      child: Row(
                        children: [
                          widthSpacer(20),
                          const Text("Room No."),
                          widthSpacer(8),
                          DropdownButton<String>(
                            underline: const SizedBox(),
                            value: selectRoom,
                            onChanged: (String? newValue) {
                              setState(
                                () {
                                  selectRoom = newValue;
                                },
                              );
                            },
                            items: (selectBlock == "A"
                                    ? roomOptionsA
                                    : roomOptionsB)
                                .map(
                              (String room) {
                                return DropdownMenuItem<String>(
                                  value: room,
                                  child: Text(room),
                                );
                              },
                            ).toList(),
                          ),
                          widthSpacer(20),
                        ],
                      ),
                    ),
                  ],
                ),
                heightSpacer(25),
                CustomButton(
                    buttonText: "Register",
                    onTap: () {
                      // if (_formkey.currentState!.validate()) {
                      // } else {}
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }),
                heightSpacer(10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    firstName.dispose();
    lastName.dispose();
    phone.dispose();
    super.dispose();
  }
}
