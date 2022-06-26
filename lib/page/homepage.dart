import 'package:dicoding_submission/const/catalog_data.dart';
import 'package:dicoding_submission/widget/thumbnail_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
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
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsetsDirectional.only(
                top: 25,
                start: 20.0,
                bottom: 0.0,
                end: 20,
              ),
              stretchModes: const [
                StretchMode.zoomBackground,
              ],
              title: Center(
                child: Stack(
                  children: const [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Cake Catalog"),
                    ),
                  ],
                ),
              ),
              background: Image.asset(
                "assets/image/header_image.png",
                fit: BoxFit.cover,
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
                    cakePath: cakeList[index]["path"],
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
