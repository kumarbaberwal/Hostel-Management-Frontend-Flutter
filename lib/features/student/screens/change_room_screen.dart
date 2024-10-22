import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piethostel/common/custom_text_field.dart';
import 'package:piethostel/common/spacing.dart';
import 'package:piethostel/features/auth/widgets/custom_button.dart';

class ChangeRoomScreen extends StatefulWidget {
  const ChangeRoomScreen({super.key});

  @override
  State<ChangeRoomScreen> createState() => _ChangeRoomScreenState();
}

class _ChangeRoomScreenState extends State<ChangeRoomScreen> {
  String? selectBlock;
  String? selectRoom;
  TextEditingController reason = TextEditingController();
  List<String> blockOptions = ["A", "B"];
  List<String> roomOptionsA = ["101", "102", "103"];
  List<String> roomOptionsB = ["201", "202", "203"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        centerTitle: true,
        title: Text(
          "Change Room",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24.sp,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Block and Room No.",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
            heightSpacer(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  // width: double.maxFinite,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(width: 1, color: Colors.green.shade800),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Block No - B",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  // width: double.maxFinite,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(width: 1, color: Colors.green.shade800),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Room No - 201",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ),
                ),
              ],
            ),
            heightSpacer(20),
            Text(
              "Shift to Block and Room No.",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
            heightSpacer(10),
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
                        items:
                            (selectBlock == "A" ? roomOptionsA : roomOptionsB)
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
            heightSpacer(20),
            Text(
              "Reason for Change",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
            heightSpacer(10),
            CustomTextField(
              controller: reason,
              inputHint: "Write Your Reason",
            ),
            heightSpacer(30),
            CustomButton(
              buttonText: "Submit",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    reason.dispose();
    super.dispose();
  }
}
