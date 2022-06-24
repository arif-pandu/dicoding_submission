import 'package:dicoding_submission/const/color.dart';
import 'package:dicoding_submission/widget/bg.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void initMessage() {
    print("Halo");
  }

  @override
  void initState() {
    super.initState();
    initMessage();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          BGApp(height: height, width: width),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: AppColor.blackColor,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 50,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: AppColor.blackColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      color: AppColor.blackColor,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 50,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: AppColor.blackColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
