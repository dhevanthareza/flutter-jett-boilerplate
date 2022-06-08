import 'package:flutter/material.dart';

class SliderItem extends StatefulWidget {
  const SliderItem({Key? key}) : super(key: key);

  @override
  State<SliderItem> createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 263,
      height: 111,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: const Color(0xFFC4C4C4),
      ),
      child: const Center(
        child: Text("Slides Image Info Terbaru"),
      ),
    );
  }
}
