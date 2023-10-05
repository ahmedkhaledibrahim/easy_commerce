import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20,bottom: 5),
      padding:  const EdgeInsets.only(top: 10,bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 1,
      child: CarouselSlider(
        items: [
          Card(
            elevation: 20,
            child: Container(
              decoration: const BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),child: ClipRRect(child: Image.asset('assets/images/banner1.jpg',fit: BoxFit.fitHeight)),
            ),
          ),
          Card(
            elevation: 20,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),child: ClipRRect(child: Image.asset('assets/images/banner2.jpg',fit: BoxFit.fitHeight)),
            ),
          ),
          Card(
            elevation: 20,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),child: ClipRRect(child: Image.asset('assets/images/banner3.jpg',fit: BoxFit.fitHeight)),
            ),
          ),
          Card(
            elevation: 20,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),child: ClipRRect(child: Image.asset('assets/images/banner4.jpg',)),
            ),
          ),
        ],
        options: CarouselOptions(
          enlargeCenterPage: true,
          height: MediaQuery.of(context).size.height * 0.3,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }
}
