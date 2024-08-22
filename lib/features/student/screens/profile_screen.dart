import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:piethostel/common/constants.dart';
import 'package:piethostel/common/custom_text_field.dart';
import 'package:piethostel/common/spacing.dart';
import 'package:piethostel/features/auth/screens/login_screen.dart';
import 'package:piethostel/features/auth/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
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
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: false
            ? Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AppConstants.profile,
                      height: 180.h,
                      width: 180.w,
                    ),
                  ),
                  heightSpacer(10),
                  Text(
                    "You are an Admin",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppConstants.profile,
                    height: 180.h,
                    width: 180.w,
                  ),
                  heightSpacer(10),
                  Text(
                    "Kumar Baberwal",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  heightSpacer(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: double.maxFinite,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                              side: BorderSide(
                                  width: 1, color: Colors.green.shade800),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Room No - 201",
                              style: TextStyle(fontSize: 17.sp),
                            ),
                          ),
                        ),
                      ),
                      widthSpacer(30),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: double.maxFinite,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                              side: BorderSide(
                                  width: 1, color: Colors.green.shade800),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Block No - B",
                              style: TextStyle(fontSize: 17.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  heightSpacer(20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.maxFinite,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side:
                            BorderSide(width: 1, color: Colors.green.shade800),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "kumar@gmail.com",
                        style: TextStyle(fontSize: 17.sp),
                      ),
                    ),
                  ),
                  heightSpacer(20),
                  CustomTextField(
                    controller: name,
                    inputHint: "Kumar",
                    prefixIcon: const Icon(Icons.person_2_outlined),
                  ),
                  heightSpacer(20),
                  CustomTextField(
                    controller: phoneNumber,
                    inputHint: "8398038384",
                    prefixIcon: const Icon(Icons.phone),
                  ),
                  heightSpacer(20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: firstName,
                          inputHint: "Kumar",
                        ),
                      ),
                      widthSpacer(20),
                      Expanded(
                        child: CustomTextField(
                          controller: lastName,
                          inputHint: "Baberwal",
                        ),
                      ),
                    ],
                  ),
                  heightSpacer(30),
                  CustomButton(buttonText: "Save", onTap: () {})
                ],
              ),
      ),
    );
  }
}
