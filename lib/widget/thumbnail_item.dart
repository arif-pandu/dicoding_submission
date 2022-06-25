import 'package:dicoding_submission/const/color.dart';
import 'package:dicoding_submission/const/text_style.dart';
import 'package:dicoding_submission/page/detailpage.dart';
import 'package:flutter/material.dart';

class ItemThumb extends StatelessWidget {
  const ItemThumb({
    Key? key,
    required this.height,
    required this.width,
    required this.cakeName,
    required this.cakePrice,
    required this.cakeRating,
    required this.cakeTag,
    required this.cakeKeyword,
    required this.cakeDescription,
  }) : super(key: key);

  final double height;
  final double width;
  final String cakeName;
  final int cakePrice;
  final int cakeRating;
  final int cakeTag;
  final List cakeKeyword;
  final String cakeDescription;

  @override
  Widget build(BuildContext context) {
    String starUnicode = "\u2605";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(
                cakeName: cakeName,
                cakePrice: cakePrice,
                cakeRating: cakeRating,
                cakeTag: cakeTag,
                cakeKeyword: cakeKeyword,
                cakeDescription: cakeDescription,
              );
            },
          ),
        );
      },
      child: Hero(
        tag: cakeTag,
        child: Container(
          margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
          padding: const EdgeInsets.all(10),
          height: height * 0.2,
          width: width,
          decoration: BoxDecoration(
            color: AppColor.orangeColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColor.blackColor.withOpacity(0.5),
                offset: const Offset(3, 3),
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Image Thumbnail
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: AppColor.whiteColor),
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.orangeColor,
                    image: const DecorationImage(
                      image: AssetImage("assets/image/header_image.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    cakeName,
                    style: AppTextStyle.styleSubTitle,
                  ),
                  Row(
                    children: [
                      ...List.generate(
                        cakeRating.isOdd ? (cakeRating + 1) ~/ 2 : cakeRating ~/ 2,
                        (index) {
                          if (cakeRating.isEven) {
                            return Icon(Icons.star_rounded, size: 20, color: AppColor.blackColor);
                          } else {
                            int _tempCount = ((cakeRating - 1) / 2).toInt();
                            if (index < _tempCount) {
                              return Icon(Icons.star_rounded, size: 20, color: AppColor.blackColor);
                            } else {
                              return Icon(Icons.star_half_rounded, size: 20, color: AppColor.blackColor);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                    width: width * 0.5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cakeKeyword.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.whiteColor),
                          child: Text(
                            cakeKeyword[index],
                            style: AppTextStyle.styleCommon.copyWith(fontSize: 14),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
