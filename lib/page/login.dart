import 'dart:math';

import 'package:dicoding_submission/const/color.dart';
import 'package:dicoding_submission/const/test_style.dart';
import 'package:dicoding_submission/page/homepage.dart';
import 'package:dicoding_submission/widget/bg.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Color color1 = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  final Color color2 = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  void initMessage() {
    debugPrint("Hello you, if you are reading this it means the project is running successfully");
  }

  void checkValidity(String username, String password, BuildContext context) {
    if (username.isNotEmpty && password.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Welcome, $username!")));
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    } else if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill blank(s) field")));
    } else {
      // If another possibilities happen, lines below will be triggered
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("error : please contact dev team for further information")));
    }
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
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            // Generated Random Color Pattern Background
            BGApp(
              height: height,
              width: width,
              color1: color1,
              color2: color2,
            ),
            //
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Input Username Widget
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person,
                        color: AppColor.blackColor,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 24 + 10),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        height: 50,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: AppColor.blackColor),
                        ),
                        child: TextField(
                          controller: usernameController,
                          style: AppTextStyle.styleCommon,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Input Password Widget
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.lock_outline,
                        color: AppColor.blackColor,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 24 + 10),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        height: 50,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: AppColor.blackColor),
                        ),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          style: AppTextStyle.styleCommon,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Login Button
                  InkWell(
                    onTap: () {
                      debugPrint("Processing Login...");
                      checkValidity(
                        usernameController.value.text,
                        passwordController.value.text,
                        context,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                      child: Text(
                        "Login",
                        style: AppTextStyle.styleCommon.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
