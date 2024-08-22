import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piethostel/common/custom_text_field.dart';
import 'package:piethostel/common/spacing.dart';
import 'package:piethostel/features/auth/widgets/custom_button.dart';

class CreateIssueScreen extends StatefulWidget {
  const CreateIssueScreen({super.key});

  @override
  State<CreateIssueScreen> createState() => _CreateIssueScreenState();
}

class _CreateIssueScreenState extends State<CreateIssueScreen> {
  final TextEditingController studentComment = TextEditingController();
  String? selectedIssue;
  List<String> issues = [
    "Bathroom",
    "Bedroom",
    "Water",
    "Furniture",
    "Kitchen",
  ];

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
          "Create Issue",
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpacer(15),
                const Text(
                  "Room Number",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                heightSpacer(15),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.maxFinite,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(width: 1, color: Colors.green.shade800),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "201",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ),
                ),
                heightSpacer(15),
                const Text(
                  "Block Number",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                heightSpacer(15),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.maxFinite,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(width: 1, color: Colors.green.shade800),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "B",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ),
                ),
                heightSpacer(15),
                const Text(
                  "Your Email Id",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                heightSpacer(15),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.maxFinite,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(width: 1, color: Colors.green.shade800),
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
                heightSpacer(15),
                const Text(
                  "Phone Number",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                heightSpacer(15),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.maxFinite,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(width: 1, color: Colors.green.shade800),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "+91 1234567890",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ),
                ),
                heightSpacer(15),
                const Text(
                  "Issue you are facing?",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                heightSpacer(15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  width: double.maxFinite,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(width: 1, color: Colors.green.shade800),
                    ),
                  ),
                  child: DropdownButton(
                    underline: const SizedBox(),
                    isExpanded: true,
                    value: selectedIssue,
                    items: issues.map(
                      (String issue) {
                        return DropdownMenuItem(
                            value: issue, child: Text(issue));
                      },
                    ).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedIssue = value;
                      });
                    },
                  ),
                ),
                heightSpacer(15),
                const Text(
                  "Comment",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                heightSpacer(15),
                CustomTextField(
                  controller: studentComment,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Comment is required";
                    }
                    return null;
                  },
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xffd1d8ff))),
                ),
                heightSpacer(40),
                CustomButton(buttonText: "Submit", onTap: () {}),
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
    studentComment.dispose();
    super.dispose();
  }
}
