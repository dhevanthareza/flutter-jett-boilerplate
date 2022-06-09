import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/domain/entities/auth/slider.entity.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class SliderItem extends StatelessWidget {
  final SliderEntity slider;
  const SliderItem({Key? key, required this.slider}) : super(key: key);

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.0),
        child: CachedNetworkImage(
            imageUrl: slider.image!,
            fit: BoxFit.cover,
            height: 97,
            width: double.infinity,
            placeholder: (_, __) {
              return Shimmer.fromColors(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.red,
                  ),
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100);
            }),
      ),
    );
  }

  static Widget buildShimmer() {
    return AppShimmer(
      child: Container(
        width: 263,
        height: 111,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            color: Colors.grey),
      ),
    );
  }
}
