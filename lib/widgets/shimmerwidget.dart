import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? height, width;
  final double top, left, right, bottom, radius;

  const ShimmerWidget({
    Key? key,
    this.height,
    this.top = 20,
    this.left = 20,
    this.right = 20,
    this.bottom = 0,
    this.width,
    this.radius = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
      padding:
          EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
      child: SizedBox(
        width: width,
        height: height ?? 150,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.2),
          highlightColor: Colors.grey.withOpacity(0.5),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius)),
          ),
        ),
      ),
    );
  }
}

class ShimmerRoundWidget extends StatelessWidget {
  final double? height, width;
  final double top, left, right, bottom, radius;

  const ShimmerRoundWidget({
    Key? key,
    this.height,
    this.top = 20,
    this.left = 20,
    this.right = 20,
    this.bottom = 0,
    this.width,
    this.radius = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
      padding:
          EdgeInsets.only(top: top, bottom: bottom, left: left, right: right),
      child: SizedBox(
        width: width,
        height: height ?? 150,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.2),
          highlightColor: Colors.grey.withOpacity(0.5),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
