import 'package:flutter/material.dart';
import 'package:geetsunam/widgets/custom_shimmer.dart';
import 'package:geetsunam/widgets/custom_shimmer_container.dart';

class AllShimmer {
  static Widget featuredShimmer() {
    return CustomShimmer(
      widget: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: ((context, index) => const CustomShimmerContainer(
                height: 150,
                width: 325,
              ))),
    );
  }

  static Widget genreShimmer() {
    return CustomShimmer(
      widget: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: ((context, index) => const CustomShimmerContainer(
                height: 100,
                width: 100,
              ))),
    );
  }

  static Widget newReleasesShimmer() {
    return CustomShimmer(
      widget: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: ((context, index) => const CustomShimmerContainer(
                height: 100,
                width: 320,
              ))),
    );
  }
}
