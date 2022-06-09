import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jett_boilerplate/data/const/app_text.dart';
import 'package:flutter_jett_boilerplate/domain/entities/event/event.entity.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_loading.dart';
import 'package:flutter_jett_boilerplate/presentation/components/app_shimmer.dart';
import 'package:flutter_jett_boilerplate/presentation/pages/app/event/widgets/event_item.dart';
import 'package:flutter_jett_boilerplate/utils/date_utils.dart';
import 'package:flutter_jett_boilerplate/utils/string_utils.dart';
import 'package:shimmer/shimmer.dart';

class HomeEventItem extends StatelessWidget {
  final EventEntity event;
  const HomeEventItem({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 157,
      width: 113,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.0),
            child: CachedNetworkImage(
                imageUrl: event.pamflet!,
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
          // Container(
          //   width: double.infinity,
          //   height: 97,
          //   decoration: BoxDecoration(
          //     borderRadius: const BorderRadius.only(
          //       topLeft: Radius.circular(14),
          //       topRight: Radius.circular(14),
          //     ),
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: ,
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 6,
          ),
          Text(
            StringUtils.getOrElse(event.nama, "-"),
            style: AppText.p4(),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            event.tglMulai != null
                ? AppDateUtils.formatFromString(event.tglMulai)
                : "-",
            style: AppText.p5(
              color: const Color(0xFF828282),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            StringUtils.getOrElse(event.tempat, "-"),
            style: AppText.p5(
              color: const Color(0xFF222375),
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ),
    );
  }

  static Widget buildShimmer() {
    return AppShimmer(
      child: Container(
        height: 157,
        width: 113,
        margin: const EdgeInsets.only(right: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          color: Colors.grey,
        ),
      ),
    );
  }
}
