import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholder extends StatelessWidget {
  factory ShimmerPlaceholder.rectangular({
    required double height,
    required double width,
  }) {
    return ShimmerPlaceholder(height: height, width: width);
  }
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const ShimmerPlaceholder({
    Key? key,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).cardColor,
      highlightColor: Theme.of(context).cardColor.withOpacity(0.7),
      child: Container(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class MovieListShimmer extends StatelessWidget {
  final Axis scrollDirection;

  const MovieListShimmer({Key? key, this.scrollDirection = Axis.horizontal})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scrollDirection == Axis.horizontal ? 200 : null,
      child: ListView.builder(
        scrollDirection: scrollDirection,
        itemCount: 5,
        itemBuilder: (_, __) => Container(
          width: scrollDirection == Axis.horizontal ? 140 : null,
          height: scrollDirection == Axis.vertical ? 200 : null,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: const ShimmerPlaceholder(),
        ),
      ),
    );
  }
}

class MovieGridShimmer extends StatelessWidget {
  final int columns;

  const MovieGridShimmer({Key? key, this.columns = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2 / 3,
      ),
      itemCount: 6,
      itemBuilder: (_, __) => const ShimmerPlaceholder(),
    );
  }
}

class MovieDetailShimmer extends StatelessWidget {
  const MovieDetailShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).cardColor,
      highlightColor: Theme.of(context).cardColor.withOpacity(0.7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Theme.of(context).cardColor,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 28,
                  width: double.infinity,
                  color: Theme.of(context).cardColor,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 48,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 48,
                      width: 48,
                      color: Theme.of(context).cardColor,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  height: 24,
                  width: 100,
                  color: Theme.of(context).cardColor,
                ),
                const SizedBox(height: 8),
                Column(
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        height: 16,
                        width: double.infinity,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
