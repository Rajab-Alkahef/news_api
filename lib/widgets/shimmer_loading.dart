import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: const SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            ShimmerLoadingColumn(),
            SizedBox(
              height: 32,
            ),
            ShimmerLoadingColumn(),
          ],
        ),
      ),
    );
  }
}

class ShimmerLoadingColumn extends StatelessWidget {
  const ShimmerLoadingColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: double.infinity,
          height: 200.0,
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 12.0,
              color: Colors.white,
            ),
            const SizedBox(height: 8.0),
            Container(
              width: double.infinity,
              height: 12.0,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
