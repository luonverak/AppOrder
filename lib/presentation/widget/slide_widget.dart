import 'package:app_order/data/model/slide_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget slideWidget() {
  return CarouselSlider(
    items: List.generate(
      listSlide.length,
      (index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(listSlide[index].image),
          ),
        ),
      ),
    ),
    options: CarouselOptions(
      height: 200,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      initialPage: 2,
    ),
  );
}
