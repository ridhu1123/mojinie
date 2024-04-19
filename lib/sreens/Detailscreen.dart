import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Detailscreen extends StatefulWidget {
  final images;
  const Detailscreen({super.key, required this.images});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    // print("ffffffff ${widget.images}");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider.builder(
                itemCount: widget.images.length,
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) {
                  return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.images[index],
                          fit: BoxFit.contain,
                          
                        )),
                  );
                },
                options: CarouselOptions(
                  height: 300,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                )),
          ],
        ),
      ),
    );
  }
}
