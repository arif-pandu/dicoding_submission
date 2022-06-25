import 'package:dicoding_submission/const/color.dart';
import 'package:dicoding_submission/const/text_style.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.cakeName,
    required this.cakePath,
    required this.cakePrice,
    required this.cakeRating,
    required this.cakeTag,
    required this.cakeKeyword,
    required this.cakeDescription,
  }) : super(key: key);

  final String cakeName;
  final String cakePath;
  final int cakePrice;
  final int cakeRating;
  final int cakeTag;
  final List cakeKeyword;
  final String cakeDescription;

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
                // Main Header Cake Image
                //
                SizedBox(
                  height: height * 0.4,
                  width: width,
                  child: Image.asset(
                    cakePath,
                    fit: BoxFit.cover,
                  ),
                ),
                // Informations About the Cake
                //
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cake Name
                      Text(
                        cakeName,
                        style: AppTextStyle.styleTitle,
                      ),
                      // Rating
                      Padding(
                        padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
                        child: Row(
                          children: [
                            ...List.generate(
                              cakeRating.isOdd ? (cakeRating + 1) ~/ 2 : cakeRating ~/ 2,
                              (index) {
                                if (cakeRating.isEven) {
                                  return const Icon(Icons.star_rounded);
                                } else {
                                  int _tempCount = (cakeRating - 1) ~/ 2;
                                  if (index < _tempCount) {
                                    return const Icon(Icons.star_rounded);
                                  } else {
                                    return const Icon(Icons.star_half_rounded);
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      // Price
                      Text(
                        "IDR " + cakePrice.toString() + ".000",
                        style: AppTextStyle.styleSubTitle.copyWith(fontWeight: FontWeight.w400),
                      ),
                      // Cake's Keyword
                      Container(
                        height: 40,
                        width: width - 30,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cakeKeyword.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Container(
                                margin: const EdgeInsets.only(right: 15),
                                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.whiteColor, border: Border.all(width: 1, color: AppColor.blackColor)),
                                child: Text(
                                  cakeKeyword[index],
                                  style: AppTextStyle.styleCommon.copyWith(fontSize: 14),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Description Paragraph
                      Text(
                        "\u0009\u0009" + cakeDescription,
                        style: AppTextStyle.styleCommon.copyWith(
                          wordSpacing: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Positioned(
            top: 25,
            left: 15,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.blackColor.withOpacity(0.4)),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: AppColor.whiteColor,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
