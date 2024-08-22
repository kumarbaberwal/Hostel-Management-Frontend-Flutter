import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piethostel/common/custom_text_field.dart';
import 'package:piethostel/common/spacing.dart';
import 'package:piethostel/features/auth/widgets/custom_button.dart';

class CreateStaffScreen extends StatefulWidget {
  const CreateStaffScreen({super.key});

  @override
  State<CreateStaffScreen> createState() => _CreateStaffScreenState();
}

class _CreateStaffScreenState extends State<CreateStaffScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController jobRole = TextEditingController();

  final emailRegex = RegExp(r'^[\w-]+(.[\w-]+)@[\w-]+(.[\w-]+)(.[a-z]{2,})$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Create Staff",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: false
          ? const Center(
              child: Text("You don't have a permission to view this page"))
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Username",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      CustomTextField(
                        controller: username,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Colors.grey)),
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
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      CustomTextField(
                        controller: firstName,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Colors.grey)),
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
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      CustomTextField(
                        controller: lastName,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Colors.grey)),
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
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      CustomTextField(
                        controller: email,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Colors.grey)),
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
                        "Job Role",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      CustomTextField(
                        controller: jobRole,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Colors.grey)),
                        inputHint: "Enter your Job Role",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Job Role is required";
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpacer(15),
                      const Text(
                        "Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
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
                      heightSpacer(15),
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      CustomTextField(
                        controller: phoneNumber,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(color: Colors.grey)),
                        inputHint: "Enter your phone number",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Phone Number is required";
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpacer(40),
                      CustomButton(
                          buttonText: "Create Staff",
                          onTap: () {
                            if (_formKey.currentState!.validate()) {}
                          }),
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
    phoneNumber.dispose();
    jobRole.dispose();
    super.dispose();
  }
}
