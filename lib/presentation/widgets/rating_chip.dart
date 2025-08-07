import 'package:flutter/material.dart';

class RatingChip extends StatelessWidget {
  final double rating;
  final Color? backgroundColor;
  final Color? textColor;

  const RatingChip({
    Key? key,
    required this.rating,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = _getRatingColor(rating);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(
              color: textColor ?? color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Color _getRatingColor(double rating) {
    if (rating >= 8.0) {
      return Colors.green;
    } else if (rating >= 6.0) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
