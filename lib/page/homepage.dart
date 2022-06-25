// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dicoding_submission/const/catalog_data.dart';
import 'package:dicoding_submission/const/color.dart';
import 'package:dicoding_submission/widget/thumbnail_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  Alignment alignTitle = Alignment.centerLeft;

  Future<void> stretchHeader() async {
    print("Header Stretched!");
  }

  @override
  void initState() {
    super.initState();
    debugPrint("Success Login :)");
  }

  @override
  Widget build(BuildContext context) {
    //
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: height * 0.2,
            elevation: 5,
            titleSpacing: 0.0,
            stretch: true,
            stretchTriggerOffset: 50,
            onStretchTrigger: stretchHeader,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsetsDirectional.only(
                top: 25,
                start: 20.0,
                bottom: 0.0,
                end: 20,
              ),
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              title: Center(
                child: Container(
                  child: Stack(
                    children: [
                      Align(
                        alignment: alignTitle,
                        child: Text("Cake Catalog"),
                      ),
                    ],
                  ),
                ),
              ),
              background: Container(
                child: Image.asset(
                  "assets/image/header_image.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ...List.generate(
                  cakeList.length,
                  (index) => ItemThumb(
                    height: height,
                    width: width,
                    cakeName: cakeList[index]["name"],
                    cakePrice: cakeList[index]["price"],
                    cakeRating: cakeList[index]["rating"],
                    cakeTag: cakeList[index]["tag"],
                    cakeKeyword: cakeList[index]["keyword"],
                    cakeDescription: cakeList[index]["description"],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
