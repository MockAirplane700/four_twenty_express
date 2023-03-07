import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

///-----------------------------------------------------------------------------
///   SHOWCASE A BANNER SLIDER - UTILIZED CAROUSEL SLIDER
///-----------------------------------------------------------------------------

class BannerSlider extends StatefulWidget {
  final List images;
  const BannerSlider({Key? key, required this.images}) : super(key: key);

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: widget.images.map((element) {
          return Builder(builder: (context){
            return Image.network(element, fit: BoxFit.cover,);
          });
        }).toList(),
        options: CarouselOptions(
          autoPlay: true
        )
    );
  }
}
