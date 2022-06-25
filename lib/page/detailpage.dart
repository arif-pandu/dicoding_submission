import 'package:dicoding_submission/const/color.dart';
import 'package:dicoding_submission/const/text_style.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.cakeName,
    required this.cakePrice,
    required this.cakeRating,
    required this.cakeTag,
    required this.cakeKeyword,
  }) : super(key: key);

  final String cakeName;
  final int cakePrice;
  final int cakeRating;
  final int cakeTag;
  final List cakeKeyword;

  @override
  Widget build(BuildContext context) {
    //
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.4,
                  width: width,
                  child: Image.asset(
                    "assets/image/header_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cakeName,
                        style: AppTextStyle.styleTitle,
                      ),
                      Row(
                        children: [
                          ...List.generate(
                            cakeRating.isOdd ? (cakeRating + 1) ~/ 2 : cakeRating ~/ 2,
                            (index) {
                              if (cakeRating.isEven) {
                                return Icon(Icons.star_rounded);
                              } else {
                                int _tempCount = ((cakeRating - 1) / 2).toInt();
                                if (index < _tempCount) {
                                  return Icon(Icons.star_rounded);
                                } else {
                                  return Icon(Icons.star_half_rounded);
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 25,
            left: 15,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.blackColor.withOpacity(0.4)),
              child: Center(
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: AppColor.whiteColor,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
